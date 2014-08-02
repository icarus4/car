class ModelsController < ApplicationController

  layout 'models'

  before_action :get_brand_name_id, only: [:index, :show]


  def index
    @model = Model.random
    @cars = @model.cars
  end


  def show
    @model = Model.find(params[:id])
    @cars = @model.cars
  end


  private


  def format_car_data(car)
    car_data = {}

    car_data['車款'] = "#{car.brand_name} #{car.model} #{car.displacement} #{car.submodel}"
    car_data['產地'] = formatter car.made_in
    car_data['年份'] = formatter car.year
    car_data['排氣量'] = formatter car.displacement
    car_data['車門數'] = "#{car.door_num} 門"
    car_data['建議售價'] = "#{car.retail_price.to_f / 10000} 萬"
    car_data['氣囊數'] = formatter car.airbag_num
    car_data['車側氣廉'] = formatter car.has_airbags_at_side_curtain
    car_data['ABS'] = formatter car.has_abs
    car_data['緊急剎車輔助系統 (EBA)'] = formatter car.has_eba
    car_data['電子制動力分配系統 (EBD)'] = formatter car.has_ebd
    car_data['電子車身穩定系統 (ESP/VSC/...)'] = formatter car.has_esp
    return car_data
  end


  def formatter(data)
    if data.is_a?(TrueClass) or data.is_a?(FalseClass)
      return data ? 'Yes' : 'No';
    else
      return data ? data : 'N/A'
    end
  end


  def translate_false_to_not_available(data)
    return data ? data : 'N/A'
  end

  def get_brand_name_id(show_brands_has_no_car = false)
    if show_brands_has_no_car
      @brands = Brand.select(:name, :id).order(:name).all
    else
      # @brands = Brand.includes(:models).where(:models => {:count.gt => '0'}).order(:name).all
      @brands = Brand.select('brands.id, brands.name').includes(:models).group('brands.id').having('count(models.id) > ?', 0)
    end
  end

end

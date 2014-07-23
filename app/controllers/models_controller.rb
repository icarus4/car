class ModelsController < ApplicationController

  layout 'models'

  before_action :get_brand_and_model_list, only: [:index, :show]


  def index
    @car_data = format_car_data(Car.random)
  end


  def show
    car = Car.find(params[:id])
    @car_data = format_car_data(car)
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


  def get_brand_and_model_list
    @brand_and_model_list = {}
    brands = Brand.select(:id, :name).order(:name).all

    brands.each do |brand|
      @brand_and_model_list[brand.name.to_s] = [] unless @brand_and_model_list.has_key?(brand.name.to_s)

      models = brand.models.order(:name).select(:name, :id)
      models.each do |model|
        @brand_and_model_list[brand.name.to_s] << model
      end
    end
  end

end

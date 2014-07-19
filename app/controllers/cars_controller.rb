class CarsController < ApplicationController

  layout 'cars'

  def index
    @brands_and_cars = get_brands_and_cars_for_welcome_page
    @car_data = format_car_data(Car.random)
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

  def get_brands_and_cars_for_welcome_page
    cars = Car.select(:model, :submodel, :id, :brand_name, :brand_id, :displacement).order(:brand_name, :model).all
    ret = {}
    cars.each do |car|
      ret[car.brand_name.to_s] = [] unless ret.has_key?(car.brand_name.to_s)
      ret[car.brand_name.to_s] << car
    end

    return ret
  end

end

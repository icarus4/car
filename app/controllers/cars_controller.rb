class CarsController < ApplicationController

  layout 'cars'

  def index
    @brands_and_cars = get_brands_and_cars_for_welcome_page
    @car_data = format_car_data(Car.random)
  end


  private

  def format_car_data(car)
    car_data = {}

    car_data['車款'] = "#{car.model} #{car.displacement} #{car.submodel}"
    # car_data.chinese_model = car.chinese_model
    # car_data.submodel = car.submodel
    # car_data.chinese_submodel = car.chinese_submodel
    car_data['Generation'] = car.generation ? "第 #{car.generation} 代" : 'N/A'
    car_data['產地'] = formatter car.made_in
    car_data['年份'] = formatter car.year
    car_data['排氣量'] = formatter car.displacement
    car_data['車門數'] = "#{car.door_num} 門"
    car_data['油電車?'] = formatter car.is_hybrid
    car_data['電動車?'] = formatter car.is_electric_vehicle
    car_data['氣囊數'] = formatter car.airbag_num
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

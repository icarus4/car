class CarsController < ApplicationController

  layout 'cars'

  def index
    @brands_and_cars = get_brands_and_cars_for_welcome_page
    car = Car.find(1)
    @car_data = format_car_data(car)

  end


  private

  def format_car_data(car)
    car_data = CarData.new

    car_data.model = car.model
    car_data.chinese_model = car.chinese_model
    car_data.submodel = car.submodel
    car_data.chinese_submodel = car.chinese_submodel
    car_data.generation = "#{car.generation} 代"
    car_data.made_in = car.made_in
    car_data.year = car.year
    car_data.displacement = "#{car.displacement} L"
    car_data.door_num = "#{car.door_num} 門"
    car_data.is_hybrid = car.is_hybrid.to_yes_or_no
    car_data.is_electric_vehicle = car.is_electric_vehicle.to_yes_or_no
    return car_data
  end

  # def to_yes_or_no(yes_or_no)
  #   # raise if input is not true or false
  #   raise unless yes_or_no == !!yes_or_no
  #   return yes_or_no ? 'Yes' : 'No'
  # end

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

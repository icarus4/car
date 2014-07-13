class WelcomeController < ApplicationController
  def index
    # @brands = Brand.order(:name).all
    # cars_query_result = Car.select(:model, :brand_id).order(:brand_id).all
    # @cars_query_result = cars_query_result

    # @cars = {}
    # cars_query_result.each do |car|
    #   @cars[car.brand_id.to_s] = [] if @cars[car.brand_id.to_s].nil?
    #   @cars[car.brand_id.to_s] << car.model if !@cars[car.brand_id.to_s].include? car.model
    # end

    @brands_and_cars = get_brands_and_cars_for_welcome_page


  end

  private

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

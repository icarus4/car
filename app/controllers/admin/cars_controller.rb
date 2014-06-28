class Admin::CarsController < ApplicationController

  before_action :find_brand

  def index
    @cars = Car.where("brand_id = ?", params[:brand_id])
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = @brand.cars.build
  end

  def create
    @car = @brand.cars.new(car_params)

    if @car.save
      redirect_to admin_brand_car_path(@brand, @car)
    else
      redirect_to new_admin_brand_car_path
    end
  end

  def edit
    @car = @brand.cars.find(params[:id])
  end

  def update
    @car = @brand.cars.find(params[:id])

    if @car.update(car_params)
      redirect_to admin_brand_car_path(@brand, @car)
    else
      render :edit
    end
  end

  private

  def car_params
    # todo: don't use permit!
    params.require(:car).permit!
  end

  def find_brand
    @brand = Brand.find(params[:brand_id])
  end
end

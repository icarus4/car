class Admin::CarsController < ApplicationController
  def index
    @cars = Car.where("brand_id = ?", params[:brand_id])
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @brand = Brand.find(params[:brand_id])
    @car = @brand.cars.build
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to admin_brand_cars_path
    else
      render :edit
    end
  end

  private

  def car_params
    # todo: don't user permit!
    params.require(:car).permit!
  end
end

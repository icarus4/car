class Admin::CarsController < ApplicationController

  layout 'admin'
  before_action :find_brand, only: [:new, :create, :edit, :update, :destroy]

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
    @car.brand_name ||= @brand.name

    if @car.save
      redirect_to admin_brand_car_path(@brand, @car)
    else
      # redirect_to new_admin_brand_car_path
      render :new
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

  def destroy
    @car = @brand.cars.find(params[:id])
    @car.destroy

    redirect_to admin_brand_path(@brand)
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

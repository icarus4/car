class Contributions::CarsController < ApplicationController

  before_action :get_current_car, except: [:new, :create]

  def new
    @model = Model.find params[:model_id]
    @car = @model.cars.build
  end

  def create
    @model = Model.find params[:model_id]
    @car = @model.cars.new(car_params)
    if @car.save
      @car.unpublish!
      redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      @car.unpublish!
      redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
    else
      render :edit
    end
  end

  def publish
    @car.publish!
    redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
  end

  def unpublish
    @car.unpublish!
    redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
  end


  private

  def get_current_car
    @car = Car.unscoped.find params[:id]
  end

  def car_params
    params.require(:car).permit!
  end
end

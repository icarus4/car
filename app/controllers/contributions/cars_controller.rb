class Contributions::CarsController < ApplicationController
  def edit
    @car = Car.find params[:id]
  end

  def update
    @car = Car.find params[:id]
    if @car.update(car_params)
      redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
    else
      render :edit
    end
  end


  private

  def car_params
    params.require(:car).permit!
  end
end

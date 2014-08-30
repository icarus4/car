class Contributions::ModelsController < ApplicationController
  def show
    @model = Model.find params[:id]
    @cars = @model.cars
  end
end

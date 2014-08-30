class Contributions::ModelsController < ApplicationController

  before_action :authenticate_user!

  def show
    @model = Model.find params[:id]
    @cars = @model.cars.order(:submodel)
  end
end

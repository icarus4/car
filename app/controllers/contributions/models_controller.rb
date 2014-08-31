class Contributions::ModelsController < ApplicationController

  before_action :authenticate_user!

  def show
    @model = Model.find params[:id]

    # reason for unscope: default scope of Car hides unpublished cars but here we want to get ALL cars
    @cars = Car.unscoped.where(model_id: @model.id).order(:door_num, :retail_price)
  end
end

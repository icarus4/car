class Contributions::ModelsController < ApplicationController

  before_action :authenticate_user!

  def show
    @model = Model.find params[:id]

    # reason for unscope: default scope of Car hides unpublished cars but here we want to get ALL cars
    @cars = Car.unscoped.where(model_id: @model.id).order_for_display
  end

  def new
    @brand = Brand.find params[:brand_id]
    @model = @brand.models.build
  end

  def create
    @brand = Brand.find params[:brand_id]
    @model = @brand.models.new(model_params)
    if @model.save
      redirect_to contributions_path
    else
      render :new
    end
  end


  private

  def model_params
    params.require(:model).permit(:name)
  end
end

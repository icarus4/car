class ModelsController < ApplicationController

  layout 'models'

  before_action :get_brand_name_id, only: [:index, :show]


  def index
    @model = Model.random
    @cars = @model.cars
  end


  def show
    @model = Model.find(params[:id])
    @cars = @model.cars
  end


  private

  def get_brand_name_id(show_brands_has_no_car = false)
    if show_brands_has_no_car
      @brands = Brand.select(:name, :id).order(:name).all
    else
      @brands = Brand.select('brands.id, brands.name').includes(:models).group('brands.id').having('count(models.id) > ?', 0)
    end
  end

end

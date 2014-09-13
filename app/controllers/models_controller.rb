class ModelsController < ApplicationController

  layout 'models'

  before_action :get_brand_name_id, only: [:index, :show]


  def index
    @model = Model.random
    @cars = @model.cars.order_for_display
    @comments = @model.comments.order(created_at: :desc)
    @new_comment = Comment.new

    render :show
  end


  def show
    @model = Model.find(params[:id])
    @cars = @model.cars.order_for_display
    @comments = @model.comments.order(created_at: :desc)
    @new_comment = Comment.new
  end


  private

  def get_brand_name_id
    @brands = Brand.select(:name, :id).order(:name).all
  end

end

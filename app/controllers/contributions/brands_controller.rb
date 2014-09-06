class Contributions::BrandsController < ApplicationController

  before_action :authenticate_user!

  def index

  end

  def show
    @brand = Brand.find params[:id]
  end
end

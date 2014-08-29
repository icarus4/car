class Contributions::BrandsController < ApplicationController

  def index

  end

  def show
    @brand = Brand.find params[:id]
  end
end

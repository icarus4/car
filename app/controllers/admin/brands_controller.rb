class Admin::BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def show
    @brand = Brand.find(params[:id])
    @cars = Car.where("brand_id = ?", params[:id])
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to admin_brands_path
    else
      redirect_to new_admin_brand_path
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])

    if @brand.update(brand_params)
      redirect_to admin_brands_path
    else
      render :edit
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :parent_company, :website_tw, :website_global, :headquarters)
  end
end

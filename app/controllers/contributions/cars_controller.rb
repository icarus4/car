class Contributions::CarsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_current_car, except: [:new, :create]

  def new
    @model = Model.find params[:model_id]

    @last_car = @model.cars.where(is_published: [true, false]).order(updated_at: :desc).first
    if @last_car.present?
      @car = @last_car.dup
    else
      @car = @model.cars.build(@model.cars.first)
    end

  end

  def create
    @model = Model.find params[:model_id]
    @car = @model.cars.new(car_params)
    if @car.save
      # save edit history
      if current_user
        current_user.car_editions.create!(car_id: @car.id, is_creation: true)
      end

      @car.unpublish!
      flash[:success] = '新車款編輯完成！請檢查看看有沒有錯誤，沒有錯誤的話記得點選車款名稱下方的 <span class="label label-warning">公開此車款</span>，前台瀏覽網站的人才能看得到哦！'.html_safe
      redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
    else
      flash.now[:warning] = '有點小問題沒辦法儲存哦！不過請不要擔心哦~可能只是少填了資料或者資料重複了，請檢查看看紅字的錯誤~'
      render :new
    end
  end

  def edit
  end

  def update
    @car.assign_attributes(car_params)
    if !@car.changed?
      flash[:info] = '修改後的資料和原本的一模一樣哦~記得確定一下是否有改到你想改的部分'
      redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
    elsif @car.update(car_params)
      # save edit history
      if current_user
        current_user.car_editions.create!(car_id: @car.id, is_creation: false)
      end

      @car.unpublish!
      flash[:success] = '修改完成！請檢查看看有沒有錯誤，沒有錯誤的話記得點選車款名稱下方的 <span class="label label-warning">公開此車款</span>，前台瀏覽網站的人才能看得到哦！'.html_safe

      redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
    else
      flash.now[:warning] = '儲存失敗！不過請不要擔心哦~可能只是少填了資料或者資料重複了，請檢查看看紅字的錯誤~'
      render :edit
    end
  end

  def publish
    @car.publish!
    redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
  end

  def unpublish
    @car.unpublish!
    redirect_to contributions_brand_model_path(@car.model.brand, @car.model)
  end


  private

  def get_current_car
    @car = Car.unscoped.find params[:id]
  end

  def car_params
    params.require(:car).permit!
  end
end

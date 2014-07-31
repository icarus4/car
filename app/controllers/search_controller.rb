class SearchController < ApplicationController
  layout 'search'

  def index

  end

  def search
    @cars = Car.scoped
    @cars = @cars.where('airbag_num >= ?', params[:min_airbag_num]) if [0,2,4,6].include?(params[:min_airbag_num])
    @cars = @cars.where(has_airbags_at_side_curtain: true) if params[:has_airbags_at_side_curtain] == '1'
    @cars = @cars.where(has_pretension_seat_belt: true) if params[:has_pretension_seat_belt] == '1'
    @cars = @cars.where(has_isofix: true) if params[:has_isofix] == '1'
    @cars = @cars.where(has_abs: true) if params[:has_abs] == '1'
    @cars = @cars.where(has_ebd: true) if params[:has_ebd] == '1'
    @cars = @cars.where(has_eba: true) if params[:has_eba] == '1'
    @cars = @cars.where(has_esp: true) if params[:has_esp] == '1'
    @cars = @cars.where(has_cruise_control: true) if params[:has_cruise_control] == '1'
    @cars = @cars.where(has_blind_spot_monitor_system: true) if params[:has_blind_spot_monitor_system] == '1'
    @cars = @cars.where(has_tpms: true) if params[:has_tpms] == '1'
    @cars = @cars.where(has_afs: true) if params[:has_afs] == '1'
    @cars = @cars.where('retail_price <= ?', params[:max_price].to_i*10000) if params[:max_price].to_i > 0

    if @cars.empty?
      flash[:warning] = '沒有符合條件的車子哦！請減少一些條件再試試看'
      redirect_to action: 'index'
    else
      flash[:success] = '符合條件的車子如下：'
      @cars
    end
  end
end

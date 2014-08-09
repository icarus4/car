class SearchController < ApplicationController
  layout 'search'

  def index

  end

  def search
    # Todo: refactor search
    _cars = Car.scoped
    _cars = _cars.where('airbag_num >= ?', params[:min_airbag_num]) if ['0','2','4','6'].include?(params[:min_airbag_num])
    _cars = _cars.where(has_airbags_at_side_curtain: true) if params[:has_airbags_at_side_curtain] == '1'
    _cars = _cars.where(has_pretension_seat_belt: true) if params[:has_pretension_seat_belt] == '1'
    _cars = _cars.where(has_isofix: true) if params[:has_isofix] == '1'
    _cars = _cars.where(has_abs: true) if params[:has_abs] == '1'
    _cars = _cars.where(has_ebd: true) if params[:has_ebd] == '1'
    _cars = _cars.where(has_eba: true) if params[:has_eba] == '1'
    _cars = _cars.where(has_brake_override_system: true) if params[:has_brake_override_system] == '1'
    _cars = _cars.where(has_esp: true) if params[:has_esp] == '1'
    _cars = _cars.where(has_cruise_control: true) if params[:has_cruise_control] == '1'
    _cars = _cars.where(has_blind_spot_monitor_system: true) if params[:has_blind_spot_monitor_system] == '1'
    _cars = _cars.where(has_tpms: true) if params[:has_tpms] == '1'
    _cars = _cars.where(has_afs: true) if params[:has_afs] == '1'
    _cars = _cars.where('retail_price <= ?', params[:max_price].to_f) if params[:max_price].to_f > 0

    # Ordered by price, max result: 60
    _cars = _cars.order(:retail_price).limit(60)

    if _cars.empty?
      flash[:warning] = '沒有符合條件的車子哦！請減少一些條件再試試看'
      redirect_to action: 'index'
    else
      flash[:success] = "符合條件的車子共 #{_cars.size} 輛（按照售價排序）："
      @cars_group = _cars.each_slice(6).to_a
    end
  end
end

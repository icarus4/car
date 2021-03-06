class SearchController < ApplicationController
  layout 'search'

  def index

  end

  def results
    # Todo: refactor search
    _cars = Car.scoped
    _cars = _cars.where('airbag_num >= ?', params[:min_airbag_num]) if ['0','2','4','6'].include?(params[:min_airbag_num])
    _cars = _cars.where(has_airbags_at_side_curtain: true) if params[:has_airbags_at_side_curtain] == '1'
    _cars = _cars.where(has_airbag_at_driver_knee: true) if params[:has_airbag_at_driver_knee] == '1'
    _cars = _cars.where(has_isofix: true) if params[:has_isofix] == '1'
    _cars = _cars.where(has_abs: true) if params[:has_abs] == '1'
    _cars = _cars.where(has_ebd: true) if params[:has_ebd] == '1'
    _cars = _cars.where(has_eba: true) if params[:has_eba] == '1'
    _cars = _cars.where(has_brake_override_system: true) if params[:has_brake_override_system] == '1'
    _cars = _cars.where(has_esp: true) if params[:has_esp] == '1'
    _cars = _cars.where(has_cruise_control: true) if params[:has_cruise_control] == '1'
    _cars = _cars.where(has_adaptive_cruise_control: true) if params[:has_adaptive_cruise_control] == '1'
    _cars = _cars.where(has_blind_spot_monitor_system: true) if params[:has_blind_spot_monitor_system] == '1'
    _cars = _cars.where(has_city_safety_system: true) if params[:has_city_safety_system] == '1'
    _cars = _cars.where(has_tpms: true) if params[:has_tpms] == '1'
    _cars = _cars.where(has_afs: true) if params[:has_afs] == '1'
    _cars = _cars.where(has_hill_start_assist: true) if params[:has_hill_start_assist] == '1'
    _cars = _cars.where(has_lane_departure_warning_system: true) if params[:has_lane_departure_warning_system] == '1'
    _cars = _cars.where(has_lane_keeping_assist: true) if params[:has_lane_keeping_assist] == '1'
    _cars = _cars.where(has_collision_warning_and_auto_brake: true) if params[:has_collision_warning_and_auto_brake] == '1'
    _cars = _cars.where(has_attention_assist: true) if params[:has_attention_assist] == '1'
    _cars = _cars.where(made_in: '台灣') if params[:made_in] == 'tw'
    _cars = _cars.where.not(made_in: '台灣') if params[:made_in] == 'not_tw'
    _cars = _cars.where('door_num = ?', params[:door_num]) if ['4','5'].include?(params[:door_num])
    _cars = _cars.where('retail_price <= ? OR retail_price IS NULL', params[:max_price].to_f) if params[:max_price].to_f > 0

    # Show only published cars, ordered by price, max result: 100
    _cars = _cars.published.order(:retail_price).limit(100)

    if _cars.empty?
      flash.now[:warning] = '沒有符合條件的車子哦！請減少一些條件再試試看'
    else
      flash.now[:success] = "符合條件的車子共 #{_cars.size} 輛（按照售價排序）："
      @cars_group = _cars.each_slice(6).to_a
    end
  end
end

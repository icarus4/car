module SearchHelper
  def check_box_with_default_value(field_name, params, default_value)
    raise "field_name should be a symbol" unless field_name.is_a?(Symbol)
    raise "default_value should be a boolean" if default_value != true && default_value != false
    return check_box_tag(field_name, 1, set_check_box_def_checked(field_name, params, default_value))
  end

  def radio_button_with_default_value(field_name, value, params, default_value)
    raise "field_name should be a symbol" unless field_name.is_a?(Symbol)
    raise "default_value should be a string" unless default_value.is_a?(String)
    return radio_button_tag(field_name, value, set_radio_button_def_checked(field_name, value, params, default_value))
  end

  private

    def set_check_box_def_checked(sym, params, default_value)
      # FIXME: this is tooooooooo dirty to detect is there any parameters passed from url
      # if there is no parameters passed, it should only contains {"action"=>"index", "controller"=>"search"}.
      # Therefor we detect this condition by counting its size.
      return default_value if params.size <= 2

      return false if params[sym].blank?
      return true
    end

    def set_radio_button_def_checked(sym, value, params, default_value)
      if params.size > 2
        return true if params[sym].present? && params[sym] == value
        return false if params[sym].present? && params[sym] != value
      else
        return true if value == default_value
        return false if value != default_value
      end
    end

end

module ModelsHelper

  def render_car_name(car, render_full_name=true, line_break_after_brand_and_model_name=false)
    car_name = if car.display_name.present?
      if render_full_name
        if line_break_after_brand_and_model_name
          "#{car.model.brand.name}<br>#{car.display_name}".html_safe
        else
          "#{car.model.brand.name} #{car.display_name}"
        end
      else
        "#{car.display_name}"
      end
    else
      if render_full_name
        if line_break_after_brand_and_model_name
          "#{car.model.brand.name}<br>#{car.model.name}<br>#{car.displacement} #{car.submodel}".html_safe
        else
          "#{car.model.brand.name} #{car.model.name} #{car.displacement} #{car.submodel}"
        end
      else
        "#{car.displacement} #{car.submodel}"
      end
    end

    return car_name
  end

  def render_car_name_with_year(car)
    car_name = if car.display_name.present?
      "#{car.year} #{car.model.brand.name} #{car.display_name}"
    else
      "#{car.year} #{car.model.brand.name} #{car.model.name} #{car.displacement} #{car.submodel}"
    end
  end

  def render_to_yes_no_with_color(value)
    label = value ? 'label-success' : 'label-danger'
    _value = value ? 'Yes' : 'No'

    content_tag(:td) do
      content_tag(:span, _value, class: "label #{label}")
    end
  end

  def render_abs_ebd_eda_to_y_n_with_color(has_abs, has_ebd, has_eba)
    label_abs = has_abs ? 'label-success' : 'label-danger'
    label_ebd = has_ebd ? 'label-success' : 'label-danger'
    label_eba = has_eba ? 'label-success' : 'label-danger'
    _has_abs = has_abs ? 'Y' : 'N'
    _has_ebd = has_ebd ? 'Y' : 'N'
    _has_eba = has_eba ? 'Y' : 'N'

    content_tag(:td) do
      concat content_tag(:span, _has_abs, class: "label #{label_abs} extra-small-font")
      concat ' / '
      concat content_tag(:span, _has_ebd, class: "label #{label_ebd} extra-small-font")
      concat ' / '
      concat content_tag(:span, _has_eba, class: "label #{label_eba} extra-small-font")
    end
  end

  def render_airbag_field_with_color(value)
    label = if value < 4
      'label-danger'
    elsif value < 6
      'label-warning'
    elsif value < 8
      'label-success'
    else
      'label-info'
    end

    content_tag(:td) do
      content_tag(:span, value, class: "label #{label}")
    end
  end

  def render_external_link(link)
    content_tag(:td) do
      if link.blank?
        content_tag(:span, 'N/A')
      else
        content_tag(:a, link_to('連結', link, target: '_blank'))
      end
    end
  end

  def render_price(price)
    if price.nil?
      content_tag(:td) do
        content_tag(:span, 'N/A')
      end
    else
      _price = number_with_precision(price, precision: 1)
      content_tag(:td) do
        content_tag(:span, "#{_price} 萬")
      end
    end

    # number_with_delimiter(price)
  end

  def render_engine_fuel(engine_fuel)
    engine_fuel ||= '汽油'
    label_class = ''
    label_class = 'label label-info' if engine_fuel != '汽油'
    content_tag(:span, engine_fuel, class: "#{label_class}")
  end

  def render_brand_and_model_name(model)
    "#{model.brand.name} #{model.name}"
  end

  def render_made_in(made_in)
    label_class = ''
    label_class = 'label label-primary' if made_in != '台灣'

    content_tag(:td) do
      content_tag(:span, made_in, class: "#{label_class}")
    end
  end
end

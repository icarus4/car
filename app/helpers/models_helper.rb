module ModelsHelper

  def render_car_name(car)
    car_name = if car.display_name.present?
      "#{car.display_name}"
    else
      "#{car.model.name} #{car.displacement} #{car.submodel}"
    end

    return car_name
  end

  def render_to_yes_no_with_color(value)
    label = value ? 'label-success' : 'label-danger'
    _value = value ? 'Yes' : 'No'

    content_tag(:td) do
      content_tag(:span, _value, class: "label #{label}")
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
end

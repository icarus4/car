module ModelsHelper
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
    else
      'label-success'
    end

    content_tag(:td) do
      content_tag(:span, value, class: "label #{label}")
    end
  end

  def render_external_link(link)
    content_tag(:td) do
      if link.nil?
        content_tag(:span, 'N/A')
      else
        content_tag(:a, _link)
      end
    end
  end

  def render_price(price)
    if price.nil?
      content_tag(:td) do
        content_tag(:span, 'N/A')
      end
    else
      _price = price.to_f / 10000
      content_tag(:td) do
        content_tag(:span, "#{_price} 萬")
      end
    end

    # number_with_delimiter(price)
  end
end

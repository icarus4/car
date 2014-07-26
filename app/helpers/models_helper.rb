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
end

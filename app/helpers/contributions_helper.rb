module ContributionsHelper
  def render_unpublished_data(model)
    unpublished_count = model.cars.not_published.size
    if unpublished_count > 0
      content_tag(:span, "（待確認資料正確性車款數：#{unpublished_count}）")
    end
  end
end

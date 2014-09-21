module CarsHelper
  def render_creator_name(car, default_name='熱心車友')
    return car.creator.name if car.creator.present?
    return default_name
  end
end

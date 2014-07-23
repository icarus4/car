module CarsHelper
  def render_full_car_name(brand, car)
    link_to("#{car.model} #{car.displacement} #{car.submodel}", { controller: :cars, action: :show, id: car.id }, class: 'side-nav-car-link')
  end
end

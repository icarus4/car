module WelcomeHelper
  def render_full_car_name(brand, car)
    link_to("#{car.model} #{car.displacement} #{car.submodel}", admin_brand_car_path(brand, car), class: 'side-nav-car-link')
  end
end

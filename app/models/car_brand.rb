class CarBrand < ActiveRecord::Base

  validates :brand, presence: true, uniqueness: true
end

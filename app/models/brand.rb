# == Schema Information
#
# Table name: brands
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  parent_company :string(255)
#  website_tw     :string(255)
#  website_global :string(255)
#  headquarters   :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Brand < ActiveRecord::Base

  has_many :models
  has_many :cars, through: :models

  validates :name,  presence: true, uniqueness: true,
    inclusion: {
      in: %w(
        BMW
        Ford
        Honda Hyundai
        Infiniti
        Lexus
        M-Benz Mazda Mitsubishi
        Nissan
        Peugeot
        Skoda Subaru Suzuki
        Tobe Toyota
        Volkswagen Volvo
      )
    }

  validates :headquarters,  allow_nil: true,
    inclusion: {
      in: %w(
        Japan
        Taiwan
        U.S.
      )
    }
end

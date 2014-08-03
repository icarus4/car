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

  validates :name,  presence: true, uniqueness: true

  def headquarters_enum
    [['台灣'],['日本'],['美國'],['印度'],['德國'],['義大利'],['法國'],['中國'],['捷克']]
  end
end

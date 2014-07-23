# == Schema Information
#
# Table name: models
#
#  id           :integer          not null, primary key
#  brand_name   :string(255)
#  brand_id     :integer
#  name         :string(255)
#  chinese_name :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Model < ActiveRecord::Base
  belongs_to :brand
  has_many :cars

  validates :name, presence: true
  validates :brand_id, presence: true

  validates_uniqueness_of :name, scope: [:brand_id], case_sensitive: false

end

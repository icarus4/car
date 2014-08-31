# == Schema Information
#
# Table name: models
#
#  id           :integer          not null, primary key
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

  validates_uniqueness_of :name, scope: [:brand_id], case_sensitive: false, message: "已經有同名的車系了！"

  # Pick a random model
  def self.random
    # FIXME: make sure whether this way causes performance issue or not
    self.joins(:cars).first(order: 'RANDOM()')
  end
end

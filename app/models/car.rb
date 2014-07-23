# == Schema Information
#
# Table name: cars
#
#  id                              :integer          not null, primary key
#  model                           :string(255)
#  chinese_model                   :string(255)
#  submodel                        :string(255)
#  chinese_submodel                :string(255)
#  generation                      :string(255)
#  made_in                         :string(255)
#  year                            :integer
#  displacement                    :float
#  door_num                        :integer
#  is_hybrid                       :boolean
#  is_electric_vehicle             :boolean
#  airbag_num                      :integer
#  has_airbag_at_driver_front      :boolean
#  has_airbag_at_passenger_front   :boolean
#  has_airbag_at_driver_knee       :boolean
#  has_airbag_at_passenger_knee    :boolean
#  has_airbag_at_center            :boolean
#  has_airbag_for_pedestrian       :boolean
#  has_airbags_at_front_side_torso :boolean
#  has_airbags_at_rear_side_torso  :boolean
#  has_airbags_at_side_curtain     :boolean
#  has_airbags_at_seat_belt        :boolean
#  has_esp                         :boolean
#  esp_name                        :string(255)
#  has_abs                         :boolean
#  has_eba                         :boolean
#  has_ebd                         :boolean
#  has_isofix                      :boolean
#  created_at                      :datetime
#  updated_at                      :datetime
#  brand_id                        :integer
#  retail_price                    :integer
#  brand_name                      :string(255)
#

class Car < ActiveRecord::Base

  belongs_to :model

  validates :model_id,      presence: true
  validates :submodel,      presence: true
  validates :displacement,  presence: true
  validates :made_in,       presence: true, inclusion: { in: %w(Taiwan Japan U.S. India) }
  validates :year,          presence: true, numericality: { greater_than_or_equal_to: 2000 }
  validates :retail_price,  allow_nil: true, numericality: { greater_than: 0 }

  validates_uniqueness_of :submodel,      scope: [:made_in, :year, :displacement], case_sensitive: false
  validates_uniqueness_of :made_in,       scope: [:submodel, :year, :displacement], case_sensitive: false
  validates_uniqueness_of :year,          scope: [:submodel, :made_in, :displacement], case_sensitive: false
  validates_uniqueness_of :displacement,  scope: [:submodel, :year, :made_in], case_sensitive: false

  # Pick a random car
  def self.random
    # FIXME: make sure whether this way causes performance issue or not
    self.first(order: 'RANDOM()')
  end

end

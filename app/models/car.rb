# == Schema Information
#
# Table name: cars
#
#  id                              :integer          not null, primary key
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
#  has_airbags_at_front            :boolean
#  has_airbag_at_driver_knee       :boolean
#  has_airbag_at_passenger_knee    :boolean
#  has_airbag_at_front_center      :boolean
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
#  retail_price                    :float
#  brand_name                      :string(255)
#  model_id                        :integer
#  has_tpms                        :boolean
#  has_ldws                        :boolean
#  has_cruise_control              :boolean
#  has_afs                         :boolean
#  has_pretension_seat_belt        :boolean
#  has_attention_assist            :boolean
#  has_child_safety_lock           :boolean
#  has_blind_spot_monitor_system   :boolean
#  has_hill_start_assist           :boolean
#  iihs_crash_test_link            :string(255)
#  ncap_crash_test_link            :string(255)
#  ncap_rating                     :integer
#  spec_url                        :string(255)
#  is_all_data_ready               :boolean
#  has_brake_override_system       :boolean
#

class Car < ActiveRecord::Base

  MADE_IN_LIST = %w(台灣 日本 美國 德國 捷克 印度 泰國 中國 南韓 英國 法國 義大利 瑞典 西班牙 羅馬尼亞)
  ESP_NAME_LIST = %w(AdvanceTrac ASC DSC DSTC ESP MSP S-VSC StabiliTrak VDC VDCS VSA VSC)

  belongs_to :model

  before_save :calculate_airbag_number

  validates_presence_of :model_id,      message: '此欄位不可留空白'
  validates_presence_of :submodel,      message: '此欄位不可留空白'
  validates_presence_of :displacement,  message: '此欄位不可留空白'
  validates_presence_of :made_in,       message: '此欄位不可留空白'
  validates_presence_of :year,          message: '此欄位不可留空白'
  validates :year, numericality: { greater_than_or_equal_to: 2000 }
  validates :retail_price,  allow_nil: true, numericality: { greater_than: 0 }

  validates_uniqueness_of :submodel,      scope: [:made_in, :year, :displacement, :model_id, :door_num], case_sensitive: false
  validates_uniqueness_of :made_in,       scope: [:submodel, :year, :displacement, :model_id, :door_num], case_sensitive: false
  validates_uniqueness_of :year,          scope: [:submodel, :made_in, :displacement, :model_id, :door_num], case_sensitive: false
  validates_uniqueness_of :displacement,  scope: [:submodel, :year, :made_in, :model_id, :door_num], case_sensitive: false

  scope :published, -> { where(is_published: true) }
  scope :locked, -> { where(is_locked: true) }
  scope :not_locked, -> { where(is_locked: false) }
  default_scope { where(is_published: true) }

  # Pick a random car
  def self.random
    # FIXME: make sure whether this way causes performance issue or not
    self.first(order: 'RANDOM()')
  end

  def self.made_in_list
    MADE_IN_LIST
  end

  def self.esp_name_list
    ESP_NAME_LIST
  end

  def made_in_enum
    return MADE_IN_LIST.each_slice(1).to_a
  end

  def year_enum
    [[2014],[2015]]
  end

  def airbag_num_enum
    [[0],[1],[2],[3],[4],[5],[6],[7],[8]]
  end

  def esp_name_enum
    ESP_NAME_LIST.each_slice(1).to_a
  end


  private

  def calculate_airbag_number
    self.airbag_num = 0
    self.airbag_num += 2 if self.has_airbags_at_front
    self.airbag_num += 1 if self.has_airbag_at_driver_knee
    self.airbag_num += 1 if self.has_airbag_at_passenger_knee
    self.airbag_num += 1 if self.has_airbag_at_front_center
    self.airbag_num += 1 if self.has_airbag_for_pedestrian
    self.airbag_num += 2 if self.has_airbags_at_front_side_torso
    self.airbag_num += 2 if self.has_airbags_at_rear_side_torso
    self.airbag_num += 2 if self.has_airbags_at_side_curtain
  end
end

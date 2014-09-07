# == Schema Information
#
# Table name: car_editions
#
#  id          :integer          not null, primary key
#  car_id      :integer          not null
#  user_id     :integer          not null
#  is_creation :boolean          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class CarEdition < ActiveRecord::Base
  belongs_to :car
  belongs_to :user
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  user_level             :integer          default(3), not null
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  admin                  :boolean          default(FALSE)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  token                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :car_editions
  has_many :cars, through: :car_editions
  has_many :comments

  validates :name, presence: true

  def admin?
    return self.user_level == 0 ? true : false
  end

  def current_admin
    current_user && current_user.admin?
  end

  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user
      return user
    else
      registered_user = User.where(email: auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name:     auth.extra.raw_info.name,
          provider: auth.provider,
          uid:      auth.uid,
          email:    auth.info.email,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end
end

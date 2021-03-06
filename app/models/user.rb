# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  type          :string(255)      not null
#  auth_token    :string(255)      not null
#  session_token :string(255)      not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_users_on_auth_token     (auth_token) UNIQUE
#  index_users_on_session_token  (session_token)
#  index_users_on_type           (type)
#

class User < ActiveRecord::Base

  has_one :device, dependent: :destroy
  has_one :user_attribute, dependent: :destroy
  has_many :beacons, dependent: :destroy
  has_many :beacon_users, dependent: :destroy
  has_many :received_beacons, through: :beacon_users, source: :beacon
  has_many :sns_configs, class_name: "SnsConfig", foreign_key: :user_id
  has_one :facebook, class_name: "FacebookConfig", foreign_key: :user_id
  has_one :twitter, class_name: "TwitterConfig", foreign_key: :user_id
  has_one :google, class_name: "GoogleConfig", foreign_key: :user_id
  has_many :quests

  delegate :beacon_active_span, to: :user_attribute
  delegate :last_put_up_time, to: :user_attribute
  delegate :put_up_count, to: :user_attribute
  delegate :language_code, to: :user_attribute

  after_create do
    UserAttribute.create!(user_id: self.id)
  end
end

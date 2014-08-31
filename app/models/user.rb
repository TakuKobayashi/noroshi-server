# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  auth_token :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_users_on_auth_token  (auth_token) UNIQUE
#

class User < ActiveRecord::Base
  has_one :device, dependent: :destroy
  has_one :user_attribute, dependent: :destroy
  has_many :beacons, dependent: :destroy
  has_many :beacon_users, dependent: :destroy
  has_many :received_beacons, through: :beacon_users, source: :beacon
  has_many :sns_connection_infos

  after_create do
    UserAttribute.create!(user_id: self.id)
  end
end

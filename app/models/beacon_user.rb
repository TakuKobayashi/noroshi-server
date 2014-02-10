# == Schema Information
#
# Table name: beacon_users
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  beacon_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_beacon_users_on_beacon_id  (beacon_id)
#  index_beacon_users_on_user_id    (user_id)
#

class BeaconUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :beacon
end

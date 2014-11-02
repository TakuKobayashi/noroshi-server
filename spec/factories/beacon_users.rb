# == Schema Information
#
# Table name: beacon_users
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  beacon_id  :integer          not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_beacon_users_on_beacon_id   (beacon_id)
#  index_beacon_users_on_deleted_at  (deleted_at)
#  index_beacon_users_on_user_id     (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon_user do
  end
end

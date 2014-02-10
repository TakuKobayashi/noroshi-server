# == Schema Information
#
# Table name: beacon_keys
#
#  id         :integer          not null, primary key
#  beacon_id  :integer          not null
#  key        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_beacon_keys_on_beacon_id  (beacon_id)
#  index_beacon_keys_on_key        (key)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon_key do
  end
end

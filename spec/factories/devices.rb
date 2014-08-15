# == Schema Information
#
# Table name: devices
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  device_type        :string(255)      not null
#  notification_token :text
#  mac_address        :string(255)      not null
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_devices_on_mac_address  (mac_address)
#  index_devices_on_user_id      (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
  end
end

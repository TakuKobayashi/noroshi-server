# == Schema Information
#
# Table name: beacons
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  key            :string(255)      not null
#  url            :string(255)      not null
#  location_kind  :integer          not null
#  message        :string(255)
#  address        :string(255)
#  image_id       :integer          not null
#  latitude       :float(24)        not null
#  longitude      :float(24)        not null
#  elevation      :float(24)        not null
#  put_up_time    :datetime         not null
#  shut_down_time :datetime         not null
#  deleted_at     :datetime
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_beacons_on_deleted_at                      (deleted_at)
#  index_beacons_on_key                             (key) UNIQUE
#  index_beacons_on_latitude_and_longitude          (latitude,longitude)
#  index_beacons_on_put_up_time_and_shut_down_time  (put_up_time,shut_down_time)
#  index_beacons_on_user_id                         (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do
  end
end

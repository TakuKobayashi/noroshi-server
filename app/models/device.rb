# coding: utf-8
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

class Device < ActiveRecord::Base
  belongs_to :user

  module MessageKind
    PUT_UP = 1
    SHUTDOWN = 2
  end
end

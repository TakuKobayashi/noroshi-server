# == Schema Information
#
# Table name: devices
#
#  id                    :integer          not null, primary key
#  user_id               :integer          not null
#  device_type           :string(255)      not null
#  notification_token    :text
#  bluetooth_mac_address :string(255)      not null
#  created_at            :datetime
#  updated_at            :datetime
#
# Indexes
#
#  index_devices_on_user_id  (user_id)
#

require 'spec_helper'

describe Device do
  pending "add some examples to (or delete) #{__FILE__}"
end

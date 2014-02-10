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

require 'spec_helper'

describe BeaconKey do
  pending "add some examples to (or delete) #{__FILE__}"
end

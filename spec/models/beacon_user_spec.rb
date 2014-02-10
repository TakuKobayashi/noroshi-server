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

require 'spec_helper'

describe BeaconUser do
  pending "add some examples to (or delete) #{__FILE__}"
end

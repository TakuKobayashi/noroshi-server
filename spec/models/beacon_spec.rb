# == Schema Information
#
# Table name: beacons
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  key           :string(255)      not null
#  kind          :integer          not null
#  location_kind :integer          not null
#  message       :string(255)
#  image_id      :integer          not null
#  latitude      :float(24)        not null
#  longitude     :float(24)        not null
#  elevation     :float(24)        not null
#  put_up_time   :datetime         not null
#  deleted_at    :datetime
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_beacons_on_deleted_at   (deleted_at)
#  index_beacons_on_key          (key) UNIQUE
#  index_beacons_on_put_up_time  (put_up_time)
#  index_beacons_on_user_id      (user_id)
#

require 'spec_helper'

describe Beacon do
  pending "add some examples to (or delete) #{__FILE__}"
end

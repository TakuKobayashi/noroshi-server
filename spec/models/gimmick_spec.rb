# == Schema Information
#
# Table name: gimmicks
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  stage_id       :integer          not null
#  mst_gimmick_id :integer          not null
#  position_x     :float(24)        default(0.0), not null
#  position_y     :float(24)        default(0.0), not null
#  turn_number    :integer          default(0), not null
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_gimmicks_on_mst_gimmick_id  (mst_gimmick_id)
#  index_gimmicks_on_stage_id        (stage_id)
#  index_gimmicks_on_turn_number     (turn_number)
#  index_gimmicks_on_user_id         (user_id)
#

require 'rails_helper'

RSpec.describe Gimmick, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

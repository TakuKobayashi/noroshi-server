# == Schema Information
#
# Table name: gimmicks
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  stage_id       :integer          not null
#  mst_gimmick_id :integer          not null
#  postion_x      :float(24)        default(0.0), not null
#  postion_y      :float(24)        default(0.0), not null
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

class Gimmick < ActiveRecord::Base
end

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
#  deleted_at     :datetime
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_gimmicks_on_deleted_at                (deleted_at)
#  index_gimmicks_on_mst_gimmick_id            (mst_gimmick_id)
#  index_gimmicks_on_stage_id_and_turn_number  (stage_id,turn_number)
#  index_gimmicks_on_user_id                   (user_id)
#

class Gimmick < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :stage
  belongs_to :mst, class_name: "Mst::Gimmick", foreign_key: "mst_gimmick_id"
end

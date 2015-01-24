# == Schema Information
#
# Table name: mst_stage_gimmicks
#
#  id             :integer          not null, primary key
#  mst_stage_id   :integer          not null
#  mst_gimmick_id :integer          not null
#  amount         :integer          default(0), not null
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_mst_stage_gimmicks_on_mst_gimmick_id  (mst_gimmick_id)
#  index_mst_stage_gimmicks_on_mst_stage_id    (mst_stage_id)
#

class Mst::StageGimmick < ActiveRecord::Base
  belongs_to :mst_stage, class_name: "Mst::Stage"
  belongs_to :mst_gimmick, class_name: "Mst::Gimmick"
end

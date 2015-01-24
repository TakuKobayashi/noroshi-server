# == Schema Information
#
# Table name: mst_gimmicks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_mst_gimmicks_on_category  (category)
#

class Mst::Gimmick < ActiveRecord::Base
  has_many :stage_gimmicks, class_name: "Mst::StageGimmick", foreign_key: "mst_gimmick_id"
  has_many :stages, through: :stage_gimmicks, source: :mst_stage
end

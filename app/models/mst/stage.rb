# == Schema Information
#
# Table name: mst_stages
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  number       :integer          default(0), not null
#  member_count :integer          default(3), not null
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_mst_stages_on_number  (number)
#

class Mst::Stage < ActiveRecord::Base
  has_many :stage_gimmicks, class_name: "Mst::StageGimmick", foreign_key: "mst_stage_id"
  has_many :gimmicks, through: :stage_gimmicks, source: :mst_gimmick
end

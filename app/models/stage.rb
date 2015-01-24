# == Schema Information
#
# Table name: stages
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  mst_stage_id :integer          not null
#  clear        :boolean          default(FALSE), not null
#  token        :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_stages_on_created_at    (created_at)
#  index_stages_on_mst_stage_id  (mst_stage_id)
#  index_stages_on_token         (token)
#  index_stages_on_user_id       (user_id)
#

class Stage < ActiveRecord::Base
  belongs_to :user
  belongs_to :mst, class_name: "Mst::Stage", foreign_key: "mst_stage_id"
  has_many :gimmicks
  has_many :requests, class_name: "StageRequest", foreign_key: "stage_id"
end

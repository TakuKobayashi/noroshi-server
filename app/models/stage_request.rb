# == Schema Information
#
# Table name: stage_requests
#
#  id         :integer          not null, primary key
#  stage_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_stage_requests_on_stage_id  (stage_id)
#  index_stage_requests_on_user_id   (user_id)
#

class StageRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :stage
end

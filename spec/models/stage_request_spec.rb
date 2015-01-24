# == Schema Information
#
# Table name: stage_requests
#
#  id         :integer          not null, primary key
#  stage_id   :integer          not null
#  user_id    :integer          not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_stage_requests_on_deleted_at  (deleted_at)
#  index_stage_requests_on_stage_id    (stage_id)
#  index_stage_requests_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe StageRequest, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

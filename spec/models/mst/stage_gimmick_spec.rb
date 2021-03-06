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

require 'rails_helper'

RSpec.describe Mst::StageGimmick, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

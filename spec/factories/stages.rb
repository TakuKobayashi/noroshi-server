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

FactoryGirl.define do
  factory :stage do
    
  end

end

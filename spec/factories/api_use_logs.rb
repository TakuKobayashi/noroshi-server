# == Schema Information
#
# Table name: api_use_logs
#
#  id                        :integer          not null, primary key
#  mst_api_feature_config_id :integer          not null
#  use_count                 :integer          default(0), not null
#  last_used_at              :datetime         not null
#  created_at                :datetime
#  updated_at                :datetime
#
# Indexes
#
#  index_api_use_logs_on_mst_api_feature_config_id  (mst_api_feature_config_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_use_log do
  end
end

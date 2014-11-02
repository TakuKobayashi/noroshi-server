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

class ApiUseLog < ActiveRecord::Base
  belongs_to :mst_api_feature_config
end

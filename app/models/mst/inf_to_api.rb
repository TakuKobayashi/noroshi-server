# == Schema Information
#
# Table name: mst_api_configs
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  api_key    :string(255)      not null
#  secret     :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_mst_api_configs_on_type  (type)
#

class Mst::InfToApi < Mst::ApiConfig
  def self.make_short_url(url, options = {})
    mst_infto_api = Mst::InfToApi.first
    feature = mst_infto_api.api_feature_configs.make.first
    result = feature.request_api(:get,{url: url, api: mst_infto_api.api_key})
    return result["short_url"]
  end
end

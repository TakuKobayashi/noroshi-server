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

class Mst::TownQuestApi < Mst::ApiConfig
  def self.import_quest(page = 1)
    mst_townquest_api = Mst::TownQuestApi.first
    feature = mst_townquest_api.api_feature_configs.index.first
    Mst::TownQuest.importApiData(feature.request_api(:get,{api_key: mst_townquest_api.api_key, page: page}))
  end
end

# == Schema Information
#
# Table name: mst_api_feature_configs
#
#  id                     :integer          not null, primary key
#  mst_api_config_id      :integer          not null
#  category               :integer          not null
#  request_url            :string(255)      not null
#  request_format         :integer          not null
#  limit_count            :integer
#  limit_request_capacity :integer
#  limited_at             :datetime
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  mst_api_feature_configs_request_index  (mst_api_config_id,category,request_url) UNIQUE
#

class Mst::ApiFeatureConfig < ActiveRecord::Base
  belongs_to :api_config
  has_many   :api_use_logs, class_name: "ApiUseLog", foreign_key: "mst_api_feature_config_id"

  enum request_format: [
    :json,
    :xml
  ]

  enum category: [
    :index,
    :make,
    :elevation,
    :geocode
  ]

  def parse_to_hash(text)
    if self.request_format.to_sym == :json
      begin 
        result = JSON.parse(text)
      rescue JSON::ParserError => e
        result = text
      end
    elsif self.request_format.to_sym == :xml
      begin
        result = Hash.from_xml(text)
      rescue REXML::ParseException => e
        result = text
      end
    end
    return result
  end

  def request_api(method = :post, params = {}, header = {})
    http_client = HTTPClient.new
    response = http_client.send(method, self.request_url, params.compact, header.compact)
    hash = self.parse_to_hash(response.body)
    api_use_log = self.api_use_logs.first_or_initialize
    api_use_log.count_up!
    return hash
  end
end

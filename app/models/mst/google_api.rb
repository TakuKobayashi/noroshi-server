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

class Mst::GoogleApi < Mst::ApiConfig
  def self.request_elevation(lat, lon)
    mst_google_api = Mst::GoogleApi.first
    feature = mst_google_api.api_feature_configs.elevation.first
    result = feature.request_api(:get,{locations: [lat, lon].join(","), sensor: false})
    return result
  end

  def self.request_elevation(latlonset)
    hash = Hash[*latlonset.to_a.flatten]
    latlon_arrays = hash.map{|k, v| [k, v].join(",")}
    mst_google_api = Mst::GoogleApi.first
    feature = mst_google_api.api_feature_configs.elevation.first
    result = feature.request_api(:get,{locations: latlon_arrays.join("|"), sensor: false})
    return result
  end

  def self.request_geocode(lat, lon, language_code)
    mst_google_api = Mst::GoogleApi.first
    feature = mst_google_api.api_feature_configs.geocode.first
    result = feature.request_api(:get,{language: language_code, latlng: [lat, lon].join(","), sensor: false})
    return result
  end

  def self.request_geocode(latlonset, language_code)
    hash = Hash[*latlonset.to_a.flatten]
    latlon_arrays = hash.map{|k, v| [k, v].join(",")}
    mst_google_api = Mst::GoogleApi.first
    feature = mst_google_api.api_feature_configs.geocode.first
    result = feature.request_api(:get,{language: language_code, latlng: latlon_arrays.join("|"), sensor: false})
    return result
  end
end

# == Schema Information
#
# Table name: sns_configs
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  config_type       :string(255)      not null
#  uid               :string(255)      not null
#  token             :string(255)
#  token_secret      :string(255)
#  expired_at        :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  mst_api_config_id :integer          not null
#
# Indexes
#
#  index_sns_configs_on_mst_api_config_id        (mst_api_config_id)
#  index_sns_configs_on_uid                      (uid)
#  index_sns_configs_on_user_id_and_config_type  (user_id,config_type) UNIQUE
#

class FacebookConfig < SnsConfig
  def record!(auth)
  	self.mst_api_config_id = Mst::FacebookApi.first.id
    self.token = auth.credentials.token
    self.token_secret = auth.credentials.secret
    self.expired_at = Time.at(auth.credentials.expires_at.to_i) if auth.credentials.expires_at.present?
    self.save!
  end

  def feed!(text, options = {})
  	graph = setup_koala
  	logger.info graph.get_object("me")
  	logger.info graph.get_connections("me", "friends")
    graph.put_connections("me", "feed", :message => text)
  end

  private
  def setup_koala
    return Koala::Facebook::API.new(self.token)
  end
end

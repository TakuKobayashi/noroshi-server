# == Schema Information
#
# Table name: sns_configs
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  type              :string(255)      not null
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
#  index_sns_configs_on_mst_api_config_id  (mst_api_config_id)
#  index_sns_configs_on_uid                (uid)
#  index_sns_configs_on_user_id_and_type   (user_id,type) UNIQUE
#

class TwitterConfig < SnsConfig
  def record!(auth)
  	self.mst_api_config_id = Mst::TwitterApi.first.id
    self.token = auth.credentials.token
    self.token_secret = auth.credentials.secret
    self.save!
  end

  def tweet!(tweet_text, options = {})
  	twitter = setup_twitter_client
  	twitter.update(tweet_text, options)
  end

  private
  def setup_twitter_client
    twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = api.api_key
      config.consumer_secret = api.secret
      config.access_token = self.token
      config.access_token_secret = self.token_secret
    end
    return twitter
  end
end

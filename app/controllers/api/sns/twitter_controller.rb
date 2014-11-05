# coding: utf-8
class Api::Sns::TwitterController < Api::Sns::BaseController
  before_filter :setup_twitter_client

  def tweet
  	@tweet = params[:tweet]
    options = {}
    options.merge!(lat: params[:lat].to_f, long: params[:long].to_f) if params[:lat].present? && params[:long].present?
  	@twitter_client.update(@tweet, options)
    head(:ok)
  end

  private
  def setup_twitter_client
    @twitter_client = Twitter::REST::Client.new(
      consumer_key: "FsRNQOHICbiLaelPwW9GQ6Okb", 
      consumer_secret: "Doz7ypYbxH87zIvlgxcwezDYgHkvynQ589xok9vHfVowUXzHqE",
      oauth_token:     @sns.token,
      oauth_token_secret: @sns.token_secret
    )
  end
end

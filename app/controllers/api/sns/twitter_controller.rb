# coding: utf-8
class Api::Sns::TwitterController < Api::Sns::BaseController
  before_filter :twitter_client

  def tweet
  	@tweet = params[:tweet]
  	@twitter_client.update(@tweet)
  end

  private
  def twitter_client
    @twitter_client = Twitter::REST::Client.new(
      consumer_key: "FsRNQOHICbiLaelPwW9GQ6Okb", 
      consumer_secret: "Doz7ypYbxH87zIvlgxcwezDYgHkvynQ589xok9vHfVowUXzHqE",
      oauth_token:     @sns.token,
      oauth_token_secret: @sns.token_secret
    )
  end
end

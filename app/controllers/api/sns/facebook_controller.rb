# coding: utf-8
class Api::Sns::FacebookController < Api::Sns::BaseController
  before_filter :setup_facebook_client

  def tweet
    @tweet = params[:tweet]
    @facebook_client.put_wall_post(@tweet)
  end

  private
  def setup_facebook_client
    @facebook_client = Koala::Facebook::API.new(@sns.token)
  end   
end

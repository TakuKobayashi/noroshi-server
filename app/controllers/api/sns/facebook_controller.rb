# coding: utf-8
class Api::Sns::FacebookController < Api::Sns::BaseController
  def tweet
  	@sns.feed!(params[:tweet])
  end
end

# coding: utf-8
class Api::Sns::BaseController < Api::BaseController
  before_filter :load_sns_connection_config

  private
  def load_sns_connection_config
  	provider = controller_name.singularize
    @sns = @user.send(provider)
    if @sns.blank? || @sns.expired?
      session[:auth_token] = @user.auth_token
      session[:params_json] = params.to_json
      redirect_to "/auth/" + provider and return
    end
  end
end

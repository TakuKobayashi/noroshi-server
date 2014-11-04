# coding: utf-8
class SnsConnectionsController < BaseController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(id: session[:user_id], auth_token: session[:auth_token]).first
    if user.present?
      sns = user.sns_configs.where(config_type: (auth.provider.classify + "Config"))
    else
      sns = (auth.provider.classify + "Config").constantize
    end
    sns = sns.find_or_initialize_by(uid: auth.uid)
    sns.token = auth.credentials.token
    sns.token_secret = auth.credentials.secret
    if sns.user_id.present?
      sns.save!
    else
    end
    redirect_to url_for(JSON.parse(session[:params_json]))
  end
end

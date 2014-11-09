# coding: utf-8
class SnsConnectionsController < BaseController
  def create
    auth = request.env["omniauth.auth"]
    logger.info auth
    user = User.where(auth_token: session[:auth_token]).first
    sns = (auth.provider.classify + "Config").constantize
    sns = sns.where(user_id: user.id) if user.present?
    sns = sns.find_or_initialize_by(uid: auth.uid)
    sns.config_type = sns.class.to_s
    sns.record!(auth)
    redirect_to url_for(JSON.parse(session[:params_json]))
  end
end

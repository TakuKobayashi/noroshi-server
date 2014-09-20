# coding: utf-8
class SnsConnectionsController < BaseController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(id: session[:user_id], auth_token: session[:auth_token]).first
    user.sns_connection_infos.find_or_create_by(oauth_token: auth.credentials.token, oauth_token_secret: auth.credentials.secret, info_type: (auth.provider + "_info").classify)
    redirect_to root_url
  end
end

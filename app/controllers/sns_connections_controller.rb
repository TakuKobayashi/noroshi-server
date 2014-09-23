# coding: utf-8
class SnsConnectionsController < BaseController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(id: session[:user_id], auth_token: session[:auth_token]).first
    if user.present?
      sns = user.sns
    else
      sns = Sns
    end
    sns = sns.find_or_initialize_by(info_type: (auth.provider + "_info").classify, uid: auth.uid)
    sns.token = auth.credentials.token
    sns.token_secret = auth.credentials.secret
    if sns.user_id.present?
      sns.save!
    else
    end
    redirect_to root_url
  end
end

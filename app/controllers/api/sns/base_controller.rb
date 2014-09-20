# coding: utf-8
class Api::Sns::BaseController < Api::BaseController
  before_filter :load_sns_connection_info

  private
  def load_sns_connection_info
  	provider = controller_name.singularize
    @sns_info = @user.sns_connection_infos.where(info_type: (provider + "_info").classify)
    if @sns_info.blank?
      session[:auth_token] = @user.auth_token
      session[:user_id] = @user.id
      redirect_to "/auth/" + provider and return
    end
  end
end

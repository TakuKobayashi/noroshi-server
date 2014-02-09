# coding: utf-8
class TopController < BaseController
  skip_before_filter :authentication

  def index
  end

  def create_user
    User.transaction do
      @user = User.find_or_initialize_by_auth_token(params[:auth_token])
      @user.name = params[:name].to_s
      @user.save!
      if params[:registration_id].present?
        android = AndroidDevice.find_or_initialize_by_user_id(@user.id)
        android.notification_token = params[:registration_id]
        android.device_type = android.class.to_s
        android.bluetooth_mac_address = params[:mac_address]
      end
    end
    render json: {status: "OK" , auth_token: @user.auth_token, user_id: @user.id}
  end
end

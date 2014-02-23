# coding: utf-8
class TopController < BaseController
  skip_before_filter :authentication

  def index
  end

  def create_user
    User.transaction do
      @user = User.find_or_initialize_by(auth_token: params[:auth_token].strip)
      @user.name = params[:name].to_s
      @user.save!
      # TODO 以下はAndroid専用処理
      android = AndroidDevice.find_or_initialize_by(user_id: @user.id)
      android.notification_token = params[:registration_id]
      android.device_type = android.class.to_s
      token = android.decrypt_token(@user.auth_token)
      android.bluetooth_mac_address = token
      android.save!
    end
    render json: {status: "OK" , auth_token: @user.auth_token, user_id: @user.id, registration_id: params[:registration_id]}
  end
end

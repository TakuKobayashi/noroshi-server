# coding: utf-8
class TopController < BaseController
  skip_before_filter :verify_authenticity_token, only: [:create_user]

  def index
  end

  def create_user
    auth_token = Base64.decode64(params[:auth_token].to_s.strip)
    mac_address = Security::RSA.private_decrypt(auth_token)
    User.transaction do
      android = AndroidDevice.where(mac_address: mac_address).first_or_initialize
      if android.user.present?
        @user = android.user
      else
        #送られるパラメータは長い+頻繁に使いたくないので適当に作ることにする
        @user = User.new(auth_token: SecureRandom.hex)
      end
      @user.name = params[:name].to_s
      @user.save!
      # TODO 以下はAndroid専用処理
      android.user_id = @user.id
      android.notification_token = params[:registration_id]
      android.device_type = android.class.to_s
      android.save!
    end
    render json: {status: "OK" , auth_token: @user.auth_token, user_id: @user.id, registration_id: params[:registration_id]}
  end
end

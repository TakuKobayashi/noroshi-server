# coding: utf-8
class TopController < BaseController
  skip_before_filter :verify_authenticity_token, only: [:create_user]

  def index
  end

  def create_user
    auth_token = Base64.decode64(params[:auth_token].to_s.strip)
    mac_address = Security::RSA.private_decrypt(auth_token)
    User.transaction do
      @device = AndroidDevice.where(mac_address: mac_address).first_or_initialize
      if @device.user.present?
        @user = @device.user
      else
        #送られるパラメータは長い+頻繁に使いたくないので適当に作ることにする
        @user = NoroshiUser.new(auth_token: SecureRandom.hex, session_token: SecureRandom.hex, type: "NoroshiUser")
      end
      @user.name = params[:name].to_s
      @user.save!
      @user.user_attribute.language_code = params[:language_code].to_s
      @user.user_attribute.save!
      # TODO 以下はAndroid専用処理
      @device.user_id = @user.id
      @device.notification_token = params[:registration_id]
      @device.device_type = @device.class.to_s
      @device.save!
    end
  end
end

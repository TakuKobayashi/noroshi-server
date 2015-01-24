# coding: utf-8
class Api::UsersController < Api::BaseController
  skip_before_filter :authentication

  def index
    @user = MinagoraswitchUser.find_by!(auth_token: params[:auth_token])
  end

  def create
    User.transaction do
      @user = MinagoraswitchUser.new(auth_token: SecureRandom.hex, type: "MinagoraswitchUser")
      @user.name = params[:name].to_s
      @user.save!
    end
  end
end

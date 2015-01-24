# coding: utf-8
class Api::UsersController < Api::BaseController
  skip_before_filter :authentication

  def create
    User.transaction do
      @user = MinagoraswitchUser.new(auth_token: SecureRandom.hex, type: "MinagoraswitchUser")
      @user.name = params[:name].to_s
      @user.save!
    end
  end
end

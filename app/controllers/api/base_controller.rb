# coding: utf-8
class Api::BaseController < BaseController
  skip_before_filter :verify_authenticity_token
  before_filter :authentication

  private
  def authentication
    @user = User.where(auth_token: params[:auth_token]).first
    permission_denied and return false if @user.blank?
  end
end

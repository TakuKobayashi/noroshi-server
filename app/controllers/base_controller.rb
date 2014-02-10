# coding: utf-8
class BaseController < ApplicationController
  before_filter :permit_all_parameter
  before_filter :authentication

  private
  def permit_all_parameter
    params.permit!
  end

  def authentication
    @user = User.where(auth_token: params[:auth_token]).first
    render_json_error("不正なリクエスト") if @user.blank?
  end

  def render_json_error(message)
    render(json: {status: "error", message: message}, status: 400) and return
  end
end

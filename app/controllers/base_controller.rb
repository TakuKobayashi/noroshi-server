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
  end
end

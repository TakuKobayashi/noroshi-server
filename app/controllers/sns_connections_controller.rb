# coding: utf-8
class SnsConnectionsController < BaseController
  def create
    auth = request.env["omniauth.auth"]
    logger.info auth
    logger.info params[:provider].classify
    logger.info controller_name
    redirect_to root_url
  end
end

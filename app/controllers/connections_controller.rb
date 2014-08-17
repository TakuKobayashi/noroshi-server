# coding: utf-8
class ConnectionsController < BaseController

  def show
    @beacon = Beacon.where(key: params[:id]).first
    render_error("存在しない狼煙です") and return false if @beacon.blank?
    @beacon.beacon_access_logs.create!(ip_address: request.remote_ip, request_url:  request.headers["Referer"].to_s, user_agent: request.env["HTTP_USER_AGENT"])
    redirect_to(Constants::ANDROID_STORE_URL) and return false unless request.smart_phone?
    hash = {:key => @beacon.try(:key)}
    uri = Addressable::URI.new
    uri.query_values = hash
    @redirect_url = "noroshi://start" + uri.to_s
  end
end

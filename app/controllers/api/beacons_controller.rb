
# coding: utf-8
class Api::BeaconsController < Api::BaseController
  before_filter :find_beacon, only: [:shutdown, :meet]

  def put_up
    if params[:put_up_time].present?
      time = Time.at(params[:put_up_time].to_i)
    else
      time = Time.current
    end
    @beacon = @user.beacons.new
    @user.transaction do
      @beacon.message = params[:message].to_s
      @beacon.image_id = params[:image_id]
      @beacon.latitude = params[:latitude].to_f
      @beacon.longitude = params[:longitude].to_f
      @beacon.elevation = params[:elevation].to_f
      @beacon.put_up_time = time
      @beacon.shut_down_time = time + @user.beacon_active_span.second
      @beacon.location_kind = params[:location_kind]
      @beacon.key = SecureRandom.hex
      @beacon.url = Mst::InfToApi.make_short_url(connection_url(id: @beacon.key))
      @user.beacon_count_up!
      @beacon.save!
      @beacon.announce_user!(params[:user_ids].to_s.split(","))
    end
  end

  def shutdown
    @beacon.shut_down!
    head :ok
  end

  def meet
    beacon_user = @user.beacon_users.where(beacon_id: @beacon.id).first
    beacon_user.destroy
    head :ok
  end

  def unlock
    @beacon = Beacon.where(key: params[:key]).first
    raise BadRequest, "not enough params" if @beacon.blank?
    @user.beacon_users.first_or_create_by(beacon_id: @beacon.id)
  end

  private
  def find_beacon
    @beacon = Beacon.where(id: params[:id]).first
    raise BadRequest, "cannot find beacon" if @beacon.blank?
  end
end

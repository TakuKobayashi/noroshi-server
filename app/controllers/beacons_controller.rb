# coding: utf-8
class BeaconsController < BaseController
  before_filter :find_beacon, [:shutdown,:meet, :make_key]

  def put_up
    if params[:put_up_time].present?
      time = Time.at(params[:put_up_time].to_i)
    else
      time = Time.now
    end
    @beacon = @user.beacons.available(time).first
    @beacon = @user.beacons.new if @beacon.blank?
    @beacon.message = params[:message].to_s
    @beacon.image_id = params[:image_id]
    @beacon.latitude = params[:latitude].to_f
    @beacon.longitude = params[:longitude].to_f
    @beacon.elevation = params[:elevation].to_f
    @beacon.put_up_time = time
    @beacon.kind = params[:kind]
    @beacon.save!
    user_ids = @beacon.announce_user!(params[:user_ids].to_s.split(","))
    render json: @beacon.attributes.merge(send_user_ids: user_ids.join(","), status: "OK")
  end

  def shutdown
    @beacon.destroy
    render json: {status: "OK"}
  end

  def meet
    beacon_user = @user.beacon_users.where(beacon_id: @beacon.id).first
    beacon_user.destroy
    render json: {status: "OK"}
  end

  def make_key
    beacon_key = BeaconKey.find_or_initialize_by_beacon_id(@beacon.id)
    beacon_key.key = params[:key]
    beacon_key.save!
    render json: {status: "OK", key: beacon_key.key}
  end

  def unlock
    beacon_key = BeaconKey.where(key: params[:key]).first
    @user.beacon_users.find_or_create_by_beacon_id(beacon_key.beacon_id)
    render json: beacon_key.beacon.attributes.merge(status: "OK")
  end

  private
  def find_beacon
    @beacon = Beacon.where(id: params[:beacon_id]).first
  end
end

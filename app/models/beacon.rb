# coding: utf-8
# == Schema Information
#
# Table name: beacons
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  key            :string(255)      not null
#  url            :string(255)      not null
#  location_kind  :integer          not null
#  message        :string(255)
#  address        :string(255)
#  image_id       :integer          not null
#  latitude       :float(24)        not null
#  longitude      :float(24)        not null
#  elevation      :float(24)        not null
#  put_up_time    :datetime         not null
#  shut_down_time :datetime         not null
#  deleted_at     :datetime
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_beacons_on_deleted_at                      (deleted_at)
#  index_beacons_on_key                             (key) UNIQUE
#  index_beacons_on_latitude_and_longitude          (latitude,longitude)
#  index_beacons_on_put_up_time_and_shut_down_time  (put_up_time,shut_down_time)
#  index_beacons_on_user_id                         (user_id)
#

class Beacon < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_many :beacon_users, dependent: :destroy
  has_many :target_users, through: :beacon_users, source: :user
  has_many :address_components, as: :source
  has_many :beacon_access_logs

  DEFAULT_RANDOM_COUNT = 10

  scope :available, ->(time = Time.current, span){
    where("? < put_up_time AND put_up_time < ?", time - span, time + span)
  }

  enum location_kind: [
    :geocode,
    :current
  ]

  def announce_user!(user_ids)
    return [] if user_ids.blank?
    import_data = []
    beacon_users = self.beacon_users.where(user_id: user_ids)
    user_ids.each do |id|
      if beacon_users.all?{|beacon_user| beacon_user.user_id != id.to_i}
        import_data << self.beacon_users.new(user_id: id)
      end
    end
    BeaconUser.import(import_data)
    self.reload
    beacon_users = self.beacon_users
    # TODO 以下はAndroid専用処理
    AndroidDevice.delay.send_message({action: "create", datas: {Beacon.table_name => ApplicationController.helpers.custom_extract(self)}.to_json}, user_ids)
    return beacon_users
  end

  def shut_down!
    user_ids = self.beacon_users.pluck(:user_id)
    AndroidDevice.delay.send_message({action: "delete", datas: {Beacon.table_name => ApplicationController.helpers.custom_extract(self)}.to_json}, user_ids)
    self.destory
  end

  def set_address!
  end
end

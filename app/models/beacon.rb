# coding: utf-8
# == Schema Information
#
# Table name: beacons
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  key           :string(255)      not null
#  kind          :integer          not null
#  location_kind :integer          not null
#  message       :string(255)
#  image_id      :integer          not null
#  latitude      :float(24)        not null
#  longitude     :float(24)        not null
#  elevation     :float(24)        not null
#  put_up_time   :datetime         not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_beacons_on_key          (key) UNIQUE
#  index_beacons_on_put_up_time  (put_up_time)
#  index_beacons_on_user_id      (user_id)
#

class Beacon < ActiveRecord::Base
  belongs_to :user
  has_many :beacon_users, dependent: :destroy
  has_many :target_users, through: :beacon_users, source: :user

  MAX_ACTIVE_TIME = 30.minutes
  DEFAULT_RANDOM_COUNT = 10

  before_destroy do
    user_ids = self.beacon_users.pluck(:user_id)
    AndroidDevice.send_delete_message({table_name: self.table_name, db_data: Hash[self.attributes.map{|k,v| [k, v.kind_of?(Time) ? v.to_i : v] }].to_json}, user_ids)
  end

  scope :available, ->(time){
    where("? < put_up_time AND put_up_time < ?", time - MAX_ACTIVE_TIME, time + MAX_ACTIVE_TIME)
  }

  #(住所指定OR今いる位置)AND(ランダムORユーザー指定OR鍵)の組み合わせのため定数を分ける
  module Kind
    RANDOM = 1
    SELECT = 2
    KEY = 3
  end

  module LocationKind
    GEOCODE = 1
    SELF = 2
  end

  def announce_user!(user_ids)
    if self.kind == Kind::SELECT
      user_ids = user_ids
    else
      return []
    end
    import_data = []
    add_ids.each do |id|
      import_data = self.beacon_users.new(user_id: id)
    end
    BeaconUser.import(import_data)
    # TODO 以下はAndroid専用処理
    #のろしを立てた人の端末情報を暗号化して送る
    user_device = Device.where(user_id: self.user_id).first
    device_token = user_device.encript_token
    #送ったpush通知を端末のDBに突っ込むためtable名も記載
    #table_name: self.class.base_class.to_s.underscore.pluralize
    return AndroidDevice.send_save_message({token: device_token,table_name: Beacon.table_name, db_data: Hash[self.attributes.map{|k,v| [k, v.kind_of?(Time) ? v.to_i : v] }].to_json}, user_ids)
  end
end

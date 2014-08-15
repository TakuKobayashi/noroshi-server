# == Schema Information
#
# Table name: devices
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  device_type        :string(255)      not null
#  notification_token :text
#  mac_address        :string(255)      not null
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_devices_on_mac_address  (mac_address)
#  index_devices_on_user_id      (user_id)
#

class AndroidDevice < Device

  def self.send_save_message(data = {}, user_ids = [])
    data.merge!(action_kind: Device::MessageKind::PUT_UP)
    return self.send_message(data, user_ids)
  end

  def self.send_delete_message(data = {}, user_ids = [])
    data.merge!(action_kind: Device::MessageKind::PUT_UP)
    return self.send_message(data, user_ids)
  end

  private
  def self.send_message(data, user_ids = [])
    gcm = GCM.new(Constants::API_KEY)
    scope = AndroidDevice.where("notification_token IS NOT NULL")
    scope = scope.where(user_id: user_ids) if user_ids.present?
    send_user_ids = []
    scope.find_in_batches do |devices|
      registration_ids = devices.map(&:notification_token)
      response = gcm.send_notification(registration_ids, {data: data})
      send_user_ids += devices.map(&:user_id)
    end
    return send_user_ids
  end
end

# coding: utf-8
# == Schema Information
#
# Table name: devices
#
#  id                    :integer          not null, primary key
#  user_id               :integer          not null
#  device_type           :string(255)      not null
#  notification_token    :text
#  bluetooth_mac_address :string(255)      not null
#  created_at            :datetime
#  updated_at            :datetime
#
# Indexes
#
#  index_devices_on_user_id  (user_id)
#

class Device < ActiveRecord::Base
  belongs_to :user

  def set_bluetooth_mac_address(pass, auth_token, iv)
    
  end

  module MessageKind
    PUT_UP = 1
    SHUTDOWN = 2
  end

  def decrypt_token(auth_token)
    enc = Base64.decode64(auth_token)
    cipher = OpenSSL::Cipher.new("AES-128-ECB")
    cipher.decrypt()
    cipher.key = Constants::DECODE_KEY
    return cipher.update(enc) + cipher.final
  end

  def encript_token
    cipher = OpenSSL::Cipher.new("AES-128-ECB")
    # 暗号化or復号化どちらを行うかセット（今回は暗号化）
    cipher.encrypt()
    # 暗号化する際のキー文字列をセット
    cipher.key = Constants::ENCODE_KEY
    enc = cipher.update(self.bluetooth_mac_address)
    enc << cipher.final()
    return Base64.encode64(enc)
  end
end
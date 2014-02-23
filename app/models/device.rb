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

  module MessageKind
    PUT_UP = 1
    SHUTDOWN = 2
  end

  def decrypt_token(auth_token)
    encrypted_data = Base64.decode64(auth_token)
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.padding = 1
    cipher.key = Constants::DECODE_KEY
    cipher.iv = Constants::IV
    cipher.decrypt()
    return cipher.update(encrypted_data) + cipher.final
  end

  def encript_token
    cipher = OpenSSL::Cipher.new('aes-128-cbc')
    # 暗号化or復号化どちらを行うかセット（今回は暗号化）
    cipher.encrypt()
    # 暗号化する際のキー文字列をセット
    cipher.key = Constants::ENCODE_KEY
    cipher.iv = Device.hex_to_bin(Constants::IV)
    enc = cipher.update(self.bluetooth_mac_address) + cipher.final()
    return Device.bin_to_hex(enc)
  end

  def self.hex_to_bin(hex_string)
    hex_string = '0' + s if((hex_string.length & 1) != 0)
    return hex_string.scan(/../).map{ |b| b.to_i(16) }.pack('C*')
  end

  def self.bin_to_hex(bin)
    return bin.unpack('C*').map{ |b| "%02X" % b }.join('')
  end
end
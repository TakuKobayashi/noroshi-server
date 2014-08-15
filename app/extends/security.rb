# coding: utf-8
class Security
  class AES
    def self.decrypt(encrypted)
      cipher = OpenSSL::Cipher.new('aes-256-cbc')
      cipher.padding = 1
      cipher.key = Constants::DECODE_KEY
      cipher.iv = Security.hex_to_bin(Constants::IV)
      cipher.decrypt()
      return cipher.update(encrypted) + cipher.final
    end

    def self.encrypt(plain)
      cipher = OpenSSL::Cipher.new('aes-256-cbc')
      # 暗号化する際のキー文字列をセット
      cipher.padding = 1
      cipher.key = Constants::ENCODE_KEY
      cipher.iv = Security.hex_to_bin(Constants::IV)
      # 暗号化or復号化どちらを行うかセット（今回は暗号化）
      cipher.encrypt()
      enc = cipher.update(plain) + cipher.final()
      return enc
    end
  end

  class RSA
    def self.private_decrypt(encrypted)
      rsa = OpenSSL::PKey::RSA.new(Constants::PRIVATE_KEY)
      return rsa.private_decrypt(encrypted)
    end

    def self.private_encrypt(plain)
      rsa = OpenSSL::PKey::RSA.new(Constants::PRIVATE_KEY)
      return rsa.private_encrypt(plain)
    end

    def self.public_decrypt(encrypted)
      rsa = OpenSSL::PKey::RSA.new(Constants::PUBLIC_KEY)
      return rsa.public_decrypt(encrypted)
    end

    def self.public_encrypt(plain)
      rsa = OpenSSL::PKey::RSA.new(Constants::PUBLIC_KEY)
      return rsa.public_encrypt(plain)
    end
  end

  private
  def self.hex_to_bin(hex_string)
    hex_string = '0' + s if((hex_string.length & 1) != 0)
    return hex_string.scan(/../).map{ |b| b.to_i(16) }.pack('C*')
  end

  def self.bin_to_hex(bin)
    return bin.unpack('C*').map{ |b| "%02X" % b }.join('')
  end
end
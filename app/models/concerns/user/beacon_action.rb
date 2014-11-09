# coding: utf-8
module User::BeaconAction
  extend ActiveSupport::Concern

  def beacon_count_up!
  	unless self.user_attribute.last_put_up_time.try(:today?)
  	  self.user_attribute.put_up_count = 0
  	end
  	self.user_attribute.last_put_up_time = Time.current
  	self.user_attribute.put_up_count += 1
  	self.user_attribute.save!
  end
end
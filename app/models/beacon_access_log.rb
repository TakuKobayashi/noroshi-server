# coding: utf-8
# == Schema Information
#
# Table name: beacon_access_logs
#
#  id          :integer          not null, primary key
#  beacon_id   :integer          not null
#  ip_address  :string(255)      not null
#  request_url :string(255)      not null
#  user_agent  :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_beacon_access_logs_on_beacon_id    (beacon_id)
#  index_beacon_access_logs_on_request_url  (request_url)
#

class BeaconAccessLog < ActiveRecord::Base
  belongs_to :beacon
end

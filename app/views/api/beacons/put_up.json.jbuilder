json.merge!(custom_extract(@beacon))
json.beacon_users(@beacon.beacon_users) do |beacon_user|
  json.merge!(custom_extract(beacon_user))
end

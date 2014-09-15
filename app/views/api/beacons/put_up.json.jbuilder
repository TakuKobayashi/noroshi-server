json.set!(Beacon.table_name) do
  json.merge!(custom_extract(@beacon))
  json.beacon_users(@beacon_users) do |beacon_user|
    json.merge!(custom_extract(beacon_user))
  end
end
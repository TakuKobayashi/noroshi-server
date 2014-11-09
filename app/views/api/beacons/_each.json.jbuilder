json.id             beacon.id
json.user_id        beacon.user_id
json.url            beacon.url
json.key            beacon.key
json.location_kind Beacon::location_kinds[beacon.location_kind]
json.address        beacon.address
json.message        beacon.message
json.image_id       beacon.image_id
json.latitude       beacon.latitude
json.longitude      beacon.longitude
json.elevation      beacon.elevation
json.put_up_time    beacon.put_up_time.to_i * 1000
json.shut_down_time beacon.shut_down_time.to_i * 1000
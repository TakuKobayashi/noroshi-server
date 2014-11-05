json.array(@quests) do |quest|
  json.id quest.id
  json.quest_id quest.quest_id
  json.lat quest.lat
  json.lon quest.lng
  json.elevation quest.elevation
  json.elevaquestion_truncatedtion quest.question_truncated
  json.square_picture_url quest.square_picture_url
end
json.id   user.id
json.set! "state" do
  json.admin_pp user.state.admin_pp
  json.current_sector_id user.state.current_sector_id
  json.scene_chapter user.state.scene_chapter
end
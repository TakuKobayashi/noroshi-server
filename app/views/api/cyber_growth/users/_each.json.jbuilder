json.id   user.id
json.set! "state" do
  json.admin_pp user.state.admin_pp
  json.current_sector_id user.state.current_sector_id
  json.scene_chapter CyberGrowthState.scene_chapters[user.state.scene_chapter]
  json.admin_attack user.state.admin_attack
end
# coding: utf-8
class Api::TownQuestsController < Api::BaseController
  def around
    @quests = Mst::TownQuest.range(params[:lat].to_f, params[:lon].to_f, Mst::TownQuest::ACTIVE_ROUND)
  end

  def approach
  	@mst_town_quest = Mst::TownQuest.find_by(id: params[:id]).first
  	@user.quests.create!(mst_town_quest_id: @mst_town_quest.id, lat: params[:lat], lon: params[:lon])
  	redirect_to @mst_town_quest.spot_url and return
  end
end

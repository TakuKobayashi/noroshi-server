# == Schema Information
#
# Table name: mst_town_quests
#
#  id                 :integer          not null, primary key
#  quest_id           :integer          not null
#  name               :string(255)      not null
#  lat                :float(24)        not null
#  lng                :float(24)        not null
#  elevation          :float(24)
#  question_truncated :string(255)      not null
#  username           :string(255)      not null
#  user_avatar_url    :string(255)
#  spot_url           :string(255)      not null
#  square_picture_url :string(255)
#  address            :string(255)
#  rally_name         :string(255)
#  posted_at          :datetime         not null
#  modified_at        :datetime         not null
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_mst_town_quests_on_lat_and_lng  (lat,lng)
#  index_mst_town_quests_on_posted_at    (posted_at)
#  index_mst_town_quests_on_quest_id     (quest_id)
#

class Mst::TownQuest < ActiveRecord::Base
  #約2km
  ACTIVE_ROUND = 0.00184

  scope :range, ->(lat, lng, round){
    where(lat: (lat - round)..(lat + round), lng: (lng - round)..(lng + round))
  }

  def self.importApiData(data)
    data_list = []
    data.each do |cell|
      hash = {
        quest_id: cell["id"],
        address: cell["address_list"].join(" "),
        posted_at: DateTime.parse(cell["posted_at"]),
        modified_at: DateTime.parse(cell["modified_at"])
      }
      cell.delete_if{|k, v| k == "id" || k == "address_list" || k == "posted_at" || k == "modified_at" }

      data_list << Mst::TownQuest.new(hash.merge(cell))
    end
    Mst::TownQuest.import(data_list)
  end
end

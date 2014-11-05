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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mst_town_quest, :class => 'Mst::TownQuest' do
  end
end

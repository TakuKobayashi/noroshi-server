# == Schema Information
#
# Table name: quests
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  mst_town_quest_id :integer          not null
#  lat               :float(24)        not null
#  lon               :float(24)        not null
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_quests_on_user_id_and_mst_town_quest_id  (user_id,mst_town_quest_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quest do
  end
end

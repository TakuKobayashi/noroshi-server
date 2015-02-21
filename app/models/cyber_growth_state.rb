# == Schema Information
#
# Table name: cyber_growth_states
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  admin_pp          :integer          default(100), not null
#  current_sector_id :integer          not null
#  scene_chapter     :integer          default(0), not null
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_cyber_growth_states_on_current_sector_id_and_scene_chapter  (current_sector_id,scene_chapter)
#  index_cyber_growth_states_on_user_id                              (user_id)
#

class CyberGrowthState < ActiveRecord::Base
  enum scene_chapter: [
    :before_quiz,
    :before_boss,
    :after_boss
  ]
  belongs_to :current_sector, class_name: 'Mst::Sector', foreign_key: :current_sector_id
end

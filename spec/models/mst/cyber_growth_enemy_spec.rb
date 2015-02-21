# == Schema Information
#
# Table name: mst_cyber_growth_enemies
#
#  id            :integer          not null, primary key
#  mst_sector_id :integer          not null
#  hp            :integer          default(100), not null
#  attack        :integer          default(10), not null
#  category      :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_mst_cyber_growth_enemies_on_category       (category)
#  index_mst_cyber_growth_enemies_on_mst_sector_id  (mst_sector_id)
#

require 'rails_helper'

RSpec.describe Mst::CyberGrowthEnemy, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

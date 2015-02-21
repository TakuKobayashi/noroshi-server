# == Schema Information
#
# Table name: mst_sectors
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  number     :integer          default(1), not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :mst_sector, :class => 'Mst::Sector' do
    
  end

end

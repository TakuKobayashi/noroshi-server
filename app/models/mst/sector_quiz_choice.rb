# == Schema Information
#
# Table name: mst_sector_quiz_choices
#
#  id                 :integer          not null, primary key
#  mst_sector_quiz_id :integer          not null
#  title              :string(255)      not null
#  created_at         :datetime
#  updated_at         :datetime
#

class Mst::SectorQuizChoice < ActiveRecord::Base
end

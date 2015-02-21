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

class Mst::Sector < ActiveRecord::Base
 has_many :quizzes, class_name: 'Mst::SectorQuiz', foreign_key: :mst_sector_id
end
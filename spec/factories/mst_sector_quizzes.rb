# == Schema Information
#
# Table name: mst_sector_quizzes
#
#  id            :integer          not null, primary key
#  mst_sector_id :integer          not null
#  title         :string(255)      not null
#  number        :integer          default(1), not null
#  correct_index :integer          default(0), not null
#  description   :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_mst_sector_quizzes_on_correct_index  (correct_index)
#  index_mst_sector_quizzes_on_mst_sector_id  (mst_sector_id)
#

FactoryGirl.define do
  factory :mst_sector_quiz, :class => 'Mst::SectorQuiz' do
    
  end

end

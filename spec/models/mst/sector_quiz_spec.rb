# == Schema Information
#
# Table name: mst_sector_quizzes
#
#  id                :integer          not null, primary key
#  mst_sector_id     :integer          not null
#  title             :string(255)      not null
#  number            :integer          default(1), not null
#  correct_choice_id :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_mst_sector_quizzes_on_correct_choice_id  (correct_choice_id)
#  index_mst_sector_quizzes_on_mst_sector_id      (mst_sector_id)
#

require 'rails_helper'

RSpec.describe Mst::SectorQuiz, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

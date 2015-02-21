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

require 'rails_helper'

RSpec.describe Mst::SectorQuizChoice, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: mst_stages
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  number       :integer          default(0), not null
#  member_count :integer          default(3), not null
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_mst_stages_on_number  (number)
#

require 'rails_helper'

RSpec.describe Mst::Stage, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

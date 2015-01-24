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

class Mst::Stage < ActiveRecord::Base
end

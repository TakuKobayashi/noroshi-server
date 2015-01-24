# == Schema Information
#
# Table name: mst_gimmicks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_mst_gimmicks_on_category  (category)
#

require 'rails_helper'

RSpec.describe Mst::Gimmick, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

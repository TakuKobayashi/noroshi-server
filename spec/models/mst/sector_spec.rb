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

require 'rails_helper'

RSpec.describe Mst::Sector, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

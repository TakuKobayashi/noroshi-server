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

class Mst::Gimmick < ActiveRecord::Base
end

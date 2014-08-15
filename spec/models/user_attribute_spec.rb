# == Schema Information
#
# Table name: user_attributes
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  subscription :boolean          default(FALSE), not null
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_user_attributes_on_user_id  (user_id)
#

require 'spec_helper'

describe UserAttribute do
  pending "add some examples to (or delete) #{__FILE__}"
end

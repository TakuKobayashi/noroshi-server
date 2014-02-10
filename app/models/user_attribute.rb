# == Schema Information
#
# Table name: user_attributes
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  random_receive :boolean          default(FALSE), not null
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_user_attributes_on_user_id  (user_id)
#

class UserAttribute < ActiveRecord::Base
end

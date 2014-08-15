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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_attribute do
  end
end

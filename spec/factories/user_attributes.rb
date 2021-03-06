# == Schema Information
#
# Table name: user_attributes
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  language_code      :string(255)
#  beacon_active_span :integer          default(1800), not null
#  last_put_up_time   :datetime
#  put_up_count       :integer          default(0), not null
#  lock_version       :integer          default(0), not null
#  created_at         :datetime
#  updated_at         :datetime
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

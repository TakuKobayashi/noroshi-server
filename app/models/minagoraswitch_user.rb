# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  type       :string(255)      not null
#  auth_token :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_users_on_auth_token  (auth_token) UNIQUE
#  index_users_on_type        (type)
#

class MinagoraswitchUser < User
  has_many :stages, class_name: "Stage", foreign_key: "user_id"
  has_many :stage_requests
end

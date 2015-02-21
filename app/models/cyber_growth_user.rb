# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  type          :string(255)      not null
#  auth_token    :string(255)      not null
#  session_token :string(255)      not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_users_on_auth_token     (auth_token) UNIQUE
#  index_users_on_session_token  (session_token)
#  index_users_on_type           (type)
#

class CyberGrowthUser < User
  has_one :state, class_name: "CyberGrowthState", foreign_key: :user_id

  after_create do
    state = CyberGrowthState.new(user_id: self.id)
    state.current_sector_id = Mst::Sector.first.id
    state.save!
  end
end

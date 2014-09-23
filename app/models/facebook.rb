# == Schema Information
#
# Table name: sns
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  type         :string(255)      not null
#  uid          :string(255)
#  token        :string(255)
#  token_secret :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_sns_on_uid               (uid)
#  index_sns_on_user_id_and_type  (user_id,type) UNIQUE
#

class Facebook < Sns
end

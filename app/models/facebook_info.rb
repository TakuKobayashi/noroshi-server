# == Schema Information
#
# Table name: sns_connection_infos
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  info_type          :string(255)      not null
#  oauth_token        :string(255)
#  oauth_token_secret :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_sns_connection_infos_on_info_type  (info_type)
#  index_sns_connection_infos_on_user_id    (user_id)
#

class FacebookInfo < SnsConnectionInfo
end

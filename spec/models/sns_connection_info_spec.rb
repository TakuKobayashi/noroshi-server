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

require 'rails_helper'

RSpec.describe SnsConnectionInfo, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: sns_configs
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  config_type  :string(255)      not null
#  uid          :string(255)      not null
#  token        :string(255)
#  token_secret :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_sns_configs_on_uid                      (uid)
#  index_sns_configs_on_user_id_and_config_type  (user_id,config_type) UNIQUE
#

require 'rails_helper'

RSpec.describe SnsConfig, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

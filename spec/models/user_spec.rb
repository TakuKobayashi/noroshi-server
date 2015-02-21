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

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end

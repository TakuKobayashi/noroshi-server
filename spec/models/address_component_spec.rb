# == Schema Information
#
# Table name: address_components
#
#  id          :integer          not null, primary key
#  source_type :string(255)      not null
#  source_id   :integer          not null
#  name        :string(255)      not null
#  category    :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_address_components_on_category                   (category)
#  index_address_components_on_source_type_and_source_id  (source_type,source_id)
#

require 'rails_helper'

RSpec.describe AddressComponent, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

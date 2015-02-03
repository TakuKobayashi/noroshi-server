# == Schema Information
#
# Table name: sns_configs
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  config_type       :string(255)      not null
#  uid               :string(255)      not null
#  token             :string(255)
#  token_secret      :string(255)
#  expired_at        :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  mst_api_config_id :integer          not null
#
# Indexes
#
#  index_sns_configs_on_mst_api_config_id        (mst_api_config_id)
#  index_sns_configs_on_uid                      (uid)
#  index_sns_configs_on_user_id_and_config_type  (user_id,config_type) UNIQUE
#

class SnsConfig < ActiveRecord::Base
  belongs_to :user
  belongs_to :api, class_name: "Mst::ApiConfig", foreign_key: "mst_api_config_id"

  def expired?
    self.expired_at.present? && self.expired_at < Time.current
  end
end

class AddColumnMstApiConfigIdToSnsConfigs < ActiveRecord::Migration
  def up
    add_column :sns_configs, :mst_api_config_id, :integer, null: false
    add_index :sns_configs, :mst_api_config_id
  end

  def down
  	remove_column :sns_configs, :mst_api_config_id
  end
end

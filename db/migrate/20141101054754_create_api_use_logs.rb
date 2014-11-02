class CreateApiUseLogs < ActiveRecord::Migration
  def change
    create_table :api_use_logs do |t|
      t.integer  :mst_api_feature_config_id, null: false
      t.integer  :use_count,                 null: false, default: 0
      t.datetime :last_used_at,              null: false
      t.timestamps
    end
    add_index :api_use_logs, :mst_api_feature_config_id
  end
end

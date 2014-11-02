class CreateMstApiConfigs < ActiveRecord::Migration
  def change
    create_table :mst_api_configs do |t|
      t.string  :type,             null: false
      t.string  :api_key,          null: false
      t.string  :secret
      t.timestamps
    end
    add_index :mst_api_configs, :type
  end
end

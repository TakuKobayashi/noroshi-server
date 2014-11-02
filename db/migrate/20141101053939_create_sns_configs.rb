class CreateSnsConfigs < ActiveRecord::Migration
  def change
    create_table :sns_configs do |t|
      t.integer :user_id, null: false
      t.string  :config_type, null: false
      t.string  :uid, null: false
      t.string  :token
      t.string  :token_secret
      t.timestamps
    end
    add_index :sns_configs, [:user_id, :config_type], unique: true
    add_index :sns_configs, :uid
  end
end

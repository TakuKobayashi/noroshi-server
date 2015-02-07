class CreateSnsConfigs < ActiveRecord::Migration
  def change
    create_table :sns_configs do |t|
      t.integer  :user_id, null: false
      t.string   :type, null: false
      t.string   :uid, null: false
      t.string   :token
      t.string   :token_secret
      t.datetime :expired_at
      t.timestamps
    end
    add_index :sns_configs, [:user_id, :type], unique: true
    add_index :sns_configs, :uid
  end
end

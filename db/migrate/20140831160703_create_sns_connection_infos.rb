class CreateSnsConnectionInfos < ActiveRecord::Migration
  def change
    create_table :sns_connection_infos do |t|
      t.integer :user_id, null: false
      t.string  :info_type, null: false
      t.string  :oauth_token
      t.string  :oauth_token_secret
      t.timestamps
    end
    add_index :sns_connection_infos, :user_id
    add_index :sns_connection_infos, :info_type
  end
end

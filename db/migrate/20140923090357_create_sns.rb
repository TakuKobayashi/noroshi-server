class CreateSns < ActiveRecord::Migration
  def change
    create_table :sns do |t|
      t.integer :user_id, null: false
      t.string  :type, null: false
      t.string  :uid, null: false
      t.string  :token
      t.string  :token_secret
      t.timestamps
    end
    add_index :sns, [:user_id, :type], unique: true
    add_index :sns, :uid
  end
end

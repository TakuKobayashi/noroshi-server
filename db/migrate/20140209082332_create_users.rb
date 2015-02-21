class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,          null: false
      t.string :type,          null: false
      t.string :auth_token,    null: false
      t.string :session_token, null: false
      t.timestamps
    end
    add_index :users, :auth_token, unique: true
    add_index :users, :session_token
    add_index :users, :type
  end
end

class CreateBeaconUsers < ActiveRecord::Migration
  def change
    create_table :beacon_users do |t|
      t.integer :user_id,   null: false
      t.integer :beacon_id, null: false
      t.timestamps
    end
    add_index :beacon_users, :user_id
    add_index :beacon_users, :beacon_id
  end
end

class CreateBeaconKeys < ActiveRecord::Migration
  def change
    create_table :beacon_keys do |t|
      t.integer :beacon_id, null: false
      t.string  :key,       null: false
      t.timestamps
    end
    add_index :beacon_keys, :beacon_id
    add_index :beacon_keys, :key
  end
end

class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id, null: false
      t.string  :device_type, null: false
      t.text    :notification_token
      t.string  :bluetooth_mac_address, null: false
      t.timestamps
    end
    add_index :devices, :user_id
  end
end

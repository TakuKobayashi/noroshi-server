class CreateBeaconAccessLogs < ActiveRecord::Migration
  def change
    create_table :beacon_access_logs do |t|
      t.integer :beacon_id,   null: false
      t.string  :ip_address,  null: false
      t.string  :request_url, null: false
      t.string  :user_agent,  null: false
      t.timestamps
    end
    add_index :beacon_access_logs, :beacon_id
    add_index :beacon_access_logs, :request_url
  end
end

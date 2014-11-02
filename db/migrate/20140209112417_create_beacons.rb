class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.integer   :user_id,       null: false
      t.string    :key,           null: false
      t.integer   :kind,          null: false
      t.integer   :location_kind, null: false
      t.string    :message
      t.integer   :image_id,      null: false
      t.float     :latitude,      null: false
      t.float     :longitude,     null: false
      t.float     :elevation,     null: false
      t.datetime  :put_up_time,   null: false
      t.datetime  :deleted_at
      t.timestamps
    end
    add_index :beacons, :user_id
    add_index :beacons, :put_up_time
    add_index :beacons, :key, unique: true
    add_index :beacons, :deleted_at
  end
end

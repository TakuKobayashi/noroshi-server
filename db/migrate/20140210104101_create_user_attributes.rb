class CreateUserAttributes < ActiveRecord::Migration
  def change
    create_table :user_attributes do |t|
      t.integer  :user_id, null: false
      t.string   :language_code
      t.integer  :beacon_active_span, null: false, default: 30.minutes
      t.datetime :last_put_up_time
      t.integer  :put_up_count, null: false, default: 0
      t.integer  :lock_version, null: false, default: 0
      t.timestamps
    end
    add_index :user_attributes, :user_id
  end
end

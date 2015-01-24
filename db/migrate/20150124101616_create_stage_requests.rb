class CreateStageRequests < ActiveRecord::Migration
  def change
    create_table :stage_requests do |t|
      t.integer :stage_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :stage_requests, :stage_id
    add_index :stage_requests, :user_id
  end
end

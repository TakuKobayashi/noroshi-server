class CreateGimmicks < ActiveRecord::Migration
  def change
    create_table :gimmicks do |t|
      t.integer :user_id, null: false
      t.integer :stage_id, null: false
      t.integer :mst_gimmick_id, null: false
      t.float :postion_x, null: false, default: 0
      t.float :postion_y, null: false, default: 0
      t.integer :turn_number, null: false, default: 0
      t.timestamps
    end
    add_index :gimmicks, :user_id
    add_index :gimmicks, :stage_id
    add_index :gimmicks, :mst_gimmick_id
    add_index :gimmicks, :turn_number
  end
end

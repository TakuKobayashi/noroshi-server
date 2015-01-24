class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :user_id, null: false
      t.integer :mst_stage_id, null: false
      t.boolean :played, null: false, default: false
      t.boolean :clear, null: false, default: false
      t.string :token, null: false
      t.timestamps
    end
    add_index :stages, :user_id
    add_index :stages, :mst_stage_id
    add_index :stages, :token
    add_index :stages, :created_at
  end
end

class CreateMstStageGimmicks < ActiveRecord::Migration
  def change
    create_table :mst_stage_gimmicks do |t|
      t.integer :mst_stage_id, null: false
      t.integer :mst_gimmick_id, null: false
      t.integer :amount, null: false, default: 0
      t.timestamps
    end
    add_index :mst_stage_gimmicks, :mst_stage_id
    add_index :mst_stage_gimmicks, :mst_gimmick_id
  end
end

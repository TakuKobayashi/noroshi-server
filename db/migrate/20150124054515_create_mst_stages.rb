class CreateMstStages < ActiveRecord::Migration
  def change
    create_table :mst_stages do |t|
      t.string :name
      t.integer :number, null: false, default: 0
      t.integer :member_count, null: false, default: 3
      t.timestamps
    end
    add_index :mst_stages, :number
  end
end

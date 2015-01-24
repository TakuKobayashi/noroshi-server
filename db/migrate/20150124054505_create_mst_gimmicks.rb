class CreateMstGimmicks < ActiveRecord::Migration
  def change
    create_table :mst_gimmicks do |t|
      t.string :name
      t.integer :category, null: false
      t.timestamps
    end
    add_index :mst_gimmicks, :category
  end
end

class CreateMstSectors < ActiveRecord::Migration
  def change
    create_table :mst_sectors do |t|
      t.string :title, null: false
      t.integer :number, null: false, default: 1
      t.timestamps
    end
  end
end

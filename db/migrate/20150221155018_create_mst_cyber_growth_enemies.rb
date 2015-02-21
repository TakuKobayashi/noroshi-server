class CreateMstCyberGrowthEnemies < ActiveRecord::Migration
  def change
    create_table :mst_cyber_growth_enemies do |t|
      t.integer :mst_sector_id, null: false
      t.integer :hp, null: false, default: 100
      t.integer :attack, null: false, default: 10
      t.integer :category, null: false
      t.timestamps
    end
    add_index :mst_cyber_growth_enemies, :mst_sector_id
    add_index :mst_cyber_growth_enemies, :category
  end
end

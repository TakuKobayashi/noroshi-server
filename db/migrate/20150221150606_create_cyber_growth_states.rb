class CreateCyberGrowthStates < ActiveRecord::Migration
  def change
    create_table :cyber_growth_states do |t|
      t.integer :user_id, null: false
      t.integer :admin_pp, null: false, default: 100
      t.integer :current_sector_id, null: false
      t.integer :scene_chapter, null: false, default: 0
      t.timestamps
    end
    add_index :cyber_growth_states, :user_id
    add_index :cyber_growth_states, [:current_sector_id, :scene_chapter]
  end
end

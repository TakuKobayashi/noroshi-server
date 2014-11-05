class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.integer :user_id, null: false
      t.integer :mst_town_quest_id, null: false
      t.float  :lat, null: false
      t.float  :lon, null: false
      t.timestamps
    end
    add_index :quests, [:user_id, :mst_town_quest_id]
  end
end

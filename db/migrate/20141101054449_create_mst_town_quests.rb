class CreateMstTownQuests < ActiveRecord::Migration
  def change
    create_table :mst_town_quests do |t|
      t.integer :quest_id, null: false
      t.string :name, null: false
      t.float  :lat, null: false
      t.float  :lng, null: false
      t.float  :elevation
      t.string :question_truncated, null: false
      t.string :username, null: false
      t.string :user_avatar_url
      t.string :spot_url, null: false
      t.string :square_picture_url
      t.string :address
      t.string :rally_name
      t.datetime :posted_at, null: false
      t.datetime :modified_at, null: false
      t.timestamps
    end
    add_index :mst_town_quests, :quest_id
    add_index :mst_town_quests, [:lat, :lng]
    add_index :mst_town_quests, :posted_at
  end
end

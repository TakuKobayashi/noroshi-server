class CreateMstSectorQuizzes < ActiveRecord::Migration
  def change
    create_table :mst_sector_quizzes do |t|
      t.integer :mst_sector_id, null: false
      t.string :title, null: false
      t.integer :number, null: false, default: 1
      t.integer :correct_choice_id, null: false
      t.timestamps
    end
    add_index :mst_sector_quizzes, :mst_sector_id
    add_index :mst_sector_quizzes, :correct_choice_id
  end
end

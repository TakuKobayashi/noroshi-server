class CreateMstSectorQuizChoices < ActiveRecord::Migration
  def change
    create_table :mst_sector_quiz_choices do |t|
      t.integer :mst_sector_quiz_id, null: false
      t.string :title, null: false
      t.timestamps
    end
    add_index :mst_sector_quiz_choices, :mst_sector_quiz_id
  end
end

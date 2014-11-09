class CreateAddressComponents < ActiveRecord::Migration
  def change
    create_table :address_components do |t|
      t.string  :source_type,      null: false
      t.integer :source_id,        null: false
      t.string  :name,             null: false
      t.integer :category,         null: false
      t.timestamps
    end
    add_index :address_components, [:source_type, :source_id]
    add_index :address_components, :category
  end
end

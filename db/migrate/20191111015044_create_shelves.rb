class CreateShelves < ActiveRecord::Migration[6.0]
  def change
    create_table :shelves do |t|
      t.string :shelf_name
      t.string :shelf_note

      t.timestamps
    end
  end
end

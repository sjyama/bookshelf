class AddShelfIdToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :shelf_id, :integer
  end
end

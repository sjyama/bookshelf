class AddShelfIdToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :shelf, foreign_key: true
  end
end

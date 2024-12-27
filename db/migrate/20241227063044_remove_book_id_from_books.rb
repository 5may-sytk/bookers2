class RemoveBookIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :book_id, :integer
  end
end

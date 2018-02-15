class AddBodyToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :body, :text
  end
end

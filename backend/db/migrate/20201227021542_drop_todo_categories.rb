class DropTodoCategories < ActiveRecord::Migration[6.1]
  def change
    drop_table :todo_categories
  end
end

class AddCartColumnToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :cart, :boolean
  end
end

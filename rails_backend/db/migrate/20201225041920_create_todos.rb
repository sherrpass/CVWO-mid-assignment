class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :description
      t.bigint :created_at
      t.bigint :due_by
      t.boolean :completed
      t.boolean :important
      t.integer :user_id
    end
  end
end

class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :description
      t.datetime :due_date
      t.boolean :done
      t.integer :position

      t.timestamps
    end
  end
end

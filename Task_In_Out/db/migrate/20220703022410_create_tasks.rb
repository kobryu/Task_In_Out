class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :genre_id
      t.text :title, null: false
      t.text :body, null: false
      t.date :due_date
      t.timestamps
    end
  end
end

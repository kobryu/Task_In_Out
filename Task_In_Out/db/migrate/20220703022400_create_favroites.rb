class CreateFavroites < ActiveRecord::Migration[6.1]
  def change
    create_table :favroites do |t|
      t.integer :user_id, null: false
      t.integer :task_id, null: false
      t.timestamps
    end
  end
end

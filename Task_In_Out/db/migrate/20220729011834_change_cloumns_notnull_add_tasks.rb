class ChangeCloumnsNotnullAddTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :due_date, :date, null: false
  end
end

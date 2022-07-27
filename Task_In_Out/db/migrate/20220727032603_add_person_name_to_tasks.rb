class AddPersonNameToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :person_name, :string
  end
end

class CreateTodoListsUsers < ActiveRecord::Migration
  def change
    create_table :todo_lists_users, id: false do |t|
      t.references :TodoList, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end

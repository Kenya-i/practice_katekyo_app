class AddColumnsToTeacher < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :name, :string, null: false
    add_column :teachers, :email, :string, null: false
    add_column :teachers, :password_digest, :string, null: false
  end
end

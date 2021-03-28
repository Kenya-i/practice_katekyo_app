class RemoveMajorFromTeacher < ActiveRecord::Migration[6.1]
  def change
    remove_column :teachers, :major, :boolean
  end
end

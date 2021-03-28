class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :school, null: false
      t.string :self_introduction
      t.boolean :major, null: false

      t.timestamps
    end
  end
end

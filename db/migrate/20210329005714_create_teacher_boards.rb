class CreateTeacherBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_boards do |t|
      t.string :price
      t.string :title
      t.string :content
      t.string :subject
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end

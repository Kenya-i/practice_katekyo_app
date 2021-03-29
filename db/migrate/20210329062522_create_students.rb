class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :school
      t.references :parent, null: false, foreign_key: true

      t.timestamps
    end
  end
end

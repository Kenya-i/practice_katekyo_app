class AddParentEmailToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :parent_email, :string
  end
end

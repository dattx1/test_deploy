class CreateUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles do |t|
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end

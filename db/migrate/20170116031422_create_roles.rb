class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.integer :value, null: false
      t.string  :name
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_reference :user_roles, :role, foreign_key: true, null: false
  end
end

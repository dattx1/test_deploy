class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :email, null: false
      t.string  :address
      t.string  :password_digest
      t.string  :reset_digest
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end

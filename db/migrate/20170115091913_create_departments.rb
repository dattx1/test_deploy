class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.integer :value
      t.string  :name
      t.column :description, "Varchar(4000)"
      t.integer :manager_id
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end

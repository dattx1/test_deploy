class CreateDmsObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :dms_objects do |t|
      t.column :Object_Name, "Varchar(200)"
      t.integer :Created_By
      t.integer :Updated_By
      t.timestamps
    end
  end
end

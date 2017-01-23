class CreateReturnDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :return_devices do |t|
      t.integer :returnee_id, null: false
      t.column :description, "Varchar(4000)"
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end

class CreateDeviceGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :device_groups do |t|
    t.column :name, "Varchar(100)"
    t.column :description, "Varchar(4000)"
    t.integer :created_by
    t.integer :updated_by
    t.timestamps

    end
  end
end

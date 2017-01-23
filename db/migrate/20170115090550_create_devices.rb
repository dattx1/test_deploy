class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string  :device_code, null: false
      t.string  :production_name, null: false
      t.string  :model_number, null: false
      t.string  :serial_number, null: false
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end

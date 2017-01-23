class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.boolean :is_create
      t.boolean :is_update
      t.boolean :is_get
      t.boolean :is_delete
      t.timestamps
    end
    add_reference :permissions, :dms_object, foreign_key: true
    add_reference :permissions, :role, foreign_key: true
  end
end

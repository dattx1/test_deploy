class CreateRequestStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :request_statuses do |t|
      t.column :name, "Varchar(100)"
      t.integer :value
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end

class CreateRequestTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :request_types do |t|
      t.column :name, "Varchar(100)"
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end

class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.column :invoice_number, "Varchar(100)"
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end

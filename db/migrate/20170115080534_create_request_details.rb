class CreateRequestDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :request_details do |t|
    t.column :description, "Varchar(4000)"

    end
  end
end

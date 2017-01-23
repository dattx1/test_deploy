class AddRelationship < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_roles, :user, foreign_key: true, null: false
    add_foreign_key :requests, :users, column: :assignee_id
    add_reference :requests, :request_type, foreign_key: true, null: false
    add_reference :requests, :request_status, foreign_key: true, null: false
    add_reference :request_details, :request, foreign_key: true, null: false
    add_reference :request_details, :device_category, foreign_key: true, null: false
    add_reference :device_categories, :device_group, foreign_key: true, null: false
    add_reference :devices, :device_status, foreign_key: true, null: false
    add_reference :devices, :device_category, foreign_key: true, null: false
    add_reference :devices, :invoice, foreign_key: true, null: false
    add_reference :assignment_details, :device, foreign_key: true, null: false
    add_foreign_key :assignments, :users, column: :assignee_id
    add_reference :assignments, :request, foreign_key: true
    add_reference :return_device_details, :return_device, foreign_key: true, null: false
    add_reference :return_device_details, :device, foreign_key: true, null: false
    add_foreign_key :return_devices, :users, column: :returnee_id
    add_reference :users, :department, foreign_key: true
    add_foreign_key :departments, :users, column: :manager_id
  end
end

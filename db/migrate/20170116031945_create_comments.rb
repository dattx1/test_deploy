class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :object_id
      t.integer :comment_type
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_reference :comment_details, :comment, foreign_key: true
  end
end

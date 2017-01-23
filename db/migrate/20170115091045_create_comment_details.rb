class CreateCommentDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_details do |t|
      t.string  :content
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end

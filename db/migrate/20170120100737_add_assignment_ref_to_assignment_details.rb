class AddAssignmentRefToAssignmentDetails < ActiveRecord::Migration[5.0]
  def change
    add_reference :assignment_details, :assignment, foreign_key: true
  end
end

class AssignmentDetail < ApplicationRecord
  attr_accessor :device_category_id, :device_category_group_id

  belongs_to :assignment, inverse_of: :assignment_details
  belongs_to :device
end

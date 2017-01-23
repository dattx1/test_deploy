class Assignment < ApplicationRecord
  belongs_to :assignee, class_name: User.name
  belongs_to :request
  has_many :assignment_details, inverse_of: :assignment
  accepts_nested_attributes_for :assignment_details

  validates :assignment_details, presence: true

  scope :default_sort, ->{order created_at: :desc}

  scope :of_assignee, ->assignee_id do
    where assignee_id: assignee_id if assignee_id.present?
  end

  scope :of_created_by, ->created_by do
    where created_by: created_by if created_by.present?
  end

  def check_duplicate?
    assignment_details.each do |detail|
      devices = assignment_details.select{|device| device.device_id == detail.device_id}
      if devices.present? && devices.count > 1
        errors[:base] << t("assignment.message.assignment_detail_duplicate")
        return true
      end
    end
    false
  end
end

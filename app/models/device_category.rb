class DeviceCategory < ApplicationRecord
  has_many :request_details
  has_many :devices, dependent: :destroy
  belongs_to :device_group

  scope :find_by_group, ->group_id do
    where device_group_id: group_id if group_id.present?
  end
end

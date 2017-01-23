class DeviceStatus < ApplicationRecord
  has_many :devices, dependent: :destroy
  scope :not_in_ids, ->ids{where.not id: ids}
end

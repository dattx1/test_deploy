class DeviceGroup < ApplicationRecord
  has_many :device_categories, dependent: :destroy
end

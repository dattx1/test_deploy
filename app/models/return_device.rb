class ReturnDevice < ApplicationRecord
  belongs_to :users
  has_many :return_device_details, dependent: :destroy
  has_many :devises, through: :return_device_details
end

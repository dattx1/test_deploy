class RequestDetail < ApplicationRecord
  belongs_to :requests
  belongs_to :device_category
end

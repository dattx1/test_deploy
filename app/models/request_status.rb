class RequestStatus < ApplicationRecord
  has_many :requests, dependent: :destroy
end

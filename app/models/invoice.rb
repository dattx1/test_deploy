class Invoice < ApplicationRecord
  has_many :devices, dependent: :destroy
end

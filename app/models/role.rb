class Role < ApplicationRecord
  has_many :user_role, dependent: :destroy
end

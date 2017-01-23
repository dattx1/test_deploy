class Department < ApplicationRecord
  belongs_to :manager, class_name: User.name
  has_many :users, dependent: :destroy
end

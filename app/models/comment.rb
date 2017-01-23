class Comment < ApplicationRecord
  has_many :comment_details, dependent: :destroy
end

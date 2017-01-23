class Request < ApplicationRecord
  attr_accessor :creater, :updater, :readonly

  belongs_to :request_type
  belongs_to :request_status
  belongs_to :assignee, class_name: User.name
  has_many :request_details, dependent: :destroy
  has_many :devices, through: :request_details

  validates :title, :description, presence: true

  after_initialize :create_extend_data

  default_scope ->{order created_at: :desc}
  scope :find_by_actor, ->(user_id) do
    where "id in (select r.id from requests as r
    where r.assignee_id = ? or r.created_by = ? or r.updated_by= ?)", user_id,
    user_id, user_id if user_id.present?
  end
  scope :of_request_type, ->request_type_id do
    where request_type_id: request_type_id if request_type_id.present?
  end
  scope :of_request_status, ->request_status_id do
    where request_status_id: request_status_id if request_status_id.present?
  end

  private

  def create_extend_data
    self.creater = User.find_by id: created_by
    self.updater = User.find_by id: updated_by
  end
end

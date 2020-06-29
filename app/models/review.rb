class Review < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :course
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true
end

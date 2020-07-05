class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :review
  validates :text, presence: true
end

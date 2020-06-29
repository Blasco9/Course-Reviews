class Course < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :author, presence: true
  has_many :reviews
end

class User < ApplicationRecord
  has_many :reviews, foreign_key: :author_id, dependent: :destroy
  has_many :followings, foreign_key: :followed_id, dependent: :destroy
  has_many :inverse_followings, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :followings
  has_many :followeds, through: :inverse_followings
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true
  has_one_attached :photo
  has_one_attached :cover_image
end

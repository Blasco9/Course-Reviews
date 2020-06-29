class User < ApplicationRecord
  after_create :attach_default_img
  has_many :reviews, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :followings, foreign_key: :followed_id, dependent: :destroy
  has_many :inverse_followings, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :followings
  has_many :followeds, through: :inverse_followings
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true
  has_one_attached :photo
  has_one_attached :cover_image

  def users_to_follow
    if followeds.any?
      User.where("id NOT IN (#{id}, ?)", followeds.ids)
    else
      User.where.not(id: id)
    end
  end

  def attach_default_img
    if !photo.attached?
      photo.attach(io: File.open('app/assets/images/user_img.png'), filename: 'user_img.png', content_type: 'image/png')
    end
    if !cover_image.attached?
      cover_image.attach(io: File.open('app/assets/images/cover_img.jpg'), filename: 'cover_img.jpg', content_type: 'image/jpg')
    end
  end
end

class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: { minimum: 5 } 
  validates :content, presence: true
  
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end

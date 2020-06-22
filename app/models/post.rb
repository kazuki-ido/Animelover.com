class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: { minimum: 5 } 
  validates :content, presence: true
  
  has_many :comments
end

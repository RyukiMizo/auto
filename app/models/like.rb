class Like < ApplicationRecord
  mount_uploader :profile_image, ProfileImageUploader
  belongs_to :user
  has_many :hashtag_likes
end

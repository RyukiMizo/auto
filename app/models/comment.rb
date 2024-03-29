class Comment < ApplicationRecord
  mount_uploader :profile_image, ProfileImageUploader
  belongs_to :user
  has_many :hashtag_comments
end

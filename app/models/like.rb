class Like < ApplicationRecord
  belongs_to :user
  has_many :hashtag_likes
end

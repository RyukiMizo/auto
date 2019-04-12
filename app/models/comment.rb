class Comment < ApplicationRecord
  belongs_to :user
  has_many :hashtag_comments
end

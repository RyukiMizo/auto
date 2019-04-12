class Follow < ApplicationRecord
  belongs_to :user
  has_many :hashtag_follows
end

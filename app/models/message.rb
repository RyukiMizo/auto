class Message < ApplicationRecord
  belongs_to :user
  has_many :hashtag_messages
end

class Tweet < ApplicationRecord
  belongs_to :shopkeeper
  belongs_to :shop
  has_many :tweetcomments
  has_one_attached :image

  validates :title, :text, presence: true
end

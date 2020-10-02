class Tweetcomment < ApplicationRecord
  belongs_to :tweet
  belongs_to :shopkeeper, optional: true
  belongs_to :customer,   optional: true

  validates :text, presence: true
end

class Itemcomment < ApplicationRecord
  belongs_to :item
  belongs_to :shopkeeper, optional: true
  belongs_to :customer, optional: true

  validates :text, presence: true
end

class Itemcomment < ApplicationRecord
  belongs_to :item
  belongs_to :shopkeeper
  belongs_to :shop

  validates :text, references: true
end

class Itemcomment < ApplicationRecord
  belongs_to :item
  belongs_to :shopkeeper, optional: true
  belongs_to :shop, optional: true

  validates :text, references: true
end

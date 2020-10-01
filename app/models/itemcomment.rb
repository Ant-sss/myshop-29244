class Itemcomment < ApplicationRecord
  belongs_to :item 
  belongs_to :shopkeeper
  
  validates :text, presence: true
end

class Shop < ApplicationRecord
  belongs_to :shopkeeper
  has_many :items
  has_many :tweets
  has_one_attached :image
  belongs_to :itemcategory

  validates :name, :text, :image, :itemcategory, presence: true
end

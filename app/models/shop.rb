class Shop < ApplicationRecord
  belongs_to :shopkeeper
  has_many :items, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :customers, through: :favorites
  has_one_attached :image
  belongs_to :itemcategory

  validates :name, :text, :image, :itemcategory, presence: true
end

class Shop < ApplicationRecord
  belongs_to :shopkeeper
  has_many :items
  has_many :tweets
  has_one attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :name, :text, :image, presence: true
  validates :category_id, numericality: { other_than: 1 }
end

class Item < ApplicationRecord
  belongs_to :shop
  has_one :purchase
  has_one_attached :image
  has_many :comments
  belongs_to :shopkeeper
  belongs_to :itemcategory
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipfrom

  PRICE_REGEX = /[0-9]/
  with_options presence: true do
    validates :name, :text, :image
    validates :price, format: { with: PRICE_REGEX }
  end
  validates :itemcategory_id, :shipfrom_id, numericality: { other_than: 1 }
end

class Item < ApplicationRecord
  has_one :purchase
  has_one_attached :image
  has_many :comments
  belongs_to :shopkeeper
  belongs_to :shop
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipfrom
  belongs_to_active_hash :categorydetail

  PRICE_REGEX = /[0-9]/
  with_options presence: true do
    validates :name, :text, :image
    validates :price, format: { with: PRICE_REGEX }
  end
end

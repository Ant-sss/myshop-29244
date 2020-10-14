class Item < ApplicationRecord
  has_one :purchase
  has_one_attached :image
  has_many :itemcomments
  belongs_to :itemcategory
  belongs_to :shopkeeper
  belongs_to :shop
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipday
  belongs_to_active_hash :shipfrom
  

  INTEGER_REGEX = /[0-9]/
  with_options presence: true do
    validates :name, :text, :image, :imformation, :itemcategory
    validates :price, :stock, format: { with: INTEGER_REGEX }
  end
  validates :shipfrom_id, :shipday_id, numericality: { other_than: 1 }
end

class Address < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :shop_keeper, optional: true
  belongs_to_active_hash :prefecture

  POSTAL_REGEX = /\A\d{3}[-]\d{4}\z/
  with_options presence: true do
    validates :city, :house_num
    validates :postal_code, format: { with: POSTAL_REGEX }
  end
  validates :prefecture_id, numericality: { other_than: 1 }
end

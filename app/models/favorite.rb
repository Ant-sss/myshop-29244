class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :shop

  validates_uniqueness_of :shop_id, scope: :customer_id
end

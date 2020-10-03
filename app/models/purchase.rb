class Purchase < ApplicationRecord
  belogs_to :item
  belogs_to :customer
end

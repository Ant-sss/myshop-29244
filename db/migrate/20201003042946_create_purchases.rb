class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :item,     foreign_key: true, null: false
      t.references :customer, foreign_key: true, null: false
      t.timestamps
    end
  end
end

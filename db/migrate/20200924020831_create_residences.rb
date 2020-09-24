class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string :postal_code,  nill:false
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :house_num, null:false
      t.string :building_name
      t.references :customer
      t.timestamps
    end
  end
end

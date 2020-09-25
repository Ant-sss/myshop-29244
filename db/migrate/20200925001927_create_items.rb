class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,             null: false
      t.text :text,               mull: false
      t.integer :itemcategory_id, null: false
      t.integer :shipfrom_id,     null: false
      t.integer :price,           null: false
      t.references :shop,         null: false, foreign_key: true
      t.references :shopkeeper,   null: false, foreign_key: true
      t.timestamps
    end
  end
end

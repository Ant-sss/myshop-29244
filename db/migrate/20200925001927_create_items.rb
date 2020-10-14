class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,             null: false
      t.integer :price,           null: false
      t.text :text,               null: false
      t.bigint :itemcategory_id,  null: false, foreign_key: true
      t.text :size,               null: false
      t.integer :shipday_id,      null: false
      t.integer :shipfrom_id,     null: false
      t.text :imformation,        null: false
      t.integer :stock,           null: false
      t.references :shopkeeper,   null: false, foreign_key: true
      t.references :shop,         null: false, foreign_key: true
      t.timestamps
    end
  end
end

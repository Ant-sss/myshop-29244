class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name,          null: false
      t.text :text,             null: false
      t.integer :category_id,   null: false
      t.references :shopkeeper, null: false, foreign_kye: true
      t.timestamps
    end
  end
end

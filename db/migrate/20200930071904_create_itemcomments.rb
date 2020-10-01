class CreateItemcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :itemcomments do |t|
      t.text :text,             null: false
      t.references :item,       null: false, foreign_key: true
      t.references :shopkeeper, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateItemcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :itemcategories do |t|
      t.string :name,  null: false
      t.string :ancestry
      t.timestamps
    end
  end
end

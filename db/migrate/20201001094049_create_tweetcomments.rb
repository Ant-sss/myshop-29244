class CreateTweetcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :tweetcomments do |t|
      t.text :text,      null: false
      t.references :tweet,      null: false, foreign_key: true
      t.references :shopkeeper, foreign_key: true
      t.references :customer,   foreign_key: true
      t.timestamps
    end
  end
end

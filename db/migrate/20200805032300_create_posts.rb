class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content
      t.text :image
      t.integer :grade
      t.integer :subject
      t.text :unit
      t.integer :views_count
      t.text :url
      t.timestamps
    end
  end
end

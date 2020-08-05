class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.references :tags ,null: false, foreign_key: true
      t.references :posts ,null: false, foreign_key: true
      t.timestamps
    end
  end
end

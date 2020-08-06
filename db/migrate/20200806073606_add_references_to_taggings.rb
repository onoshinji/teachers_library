class AddReferencesToTaggings < ActiveRecord::Migration[5.2]
  def change
    add_reference :taggings, :tag, null: false, foreign_key: true
    add_reference :taggings, :post, null: false, foreign_key: true

  end
end

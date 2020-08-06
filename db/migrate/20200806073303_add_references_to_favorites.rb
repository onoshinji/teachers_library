class AddReferencesToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :user, null: false, foreign_key: true
    add_reference :favorites, :post, null: false, foreign_key: true
  end
end

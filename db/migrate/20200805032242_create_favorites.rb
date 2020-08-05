class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :users, null: false ,foreign_key: true
      t.references :posts, null: false ,foreign_key: true
      t.timestamps
    end
  end
end

class AddNullToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :grade, :integer, null:false , default: 0
    change_column :posts, :subject, :integer, null:false , default: 0
    change_column :posts, :content, :text, null:false
    change_column :posts, :image, :text, null:false
    change_column :posts, :unit, :text, null:false
    change_column :posts, :url, :text, null:false
  end
end

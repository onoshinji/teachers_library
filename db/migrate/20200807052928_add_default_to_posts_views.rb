class AddDefaultToPostsViews < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :views_count, :integer, null:false , default: 0
  end
end

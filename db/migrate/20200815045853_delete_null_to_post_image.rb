class DeleteNullToPostImage < ActiveRecord::Migration[5.2]
  def up
    change_column_null :posts, :image, true
  end

  def down
    change_column_null :posts, :image, false
  end
end

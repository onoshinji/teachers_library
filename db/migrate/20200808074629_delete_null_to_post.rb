class DeleteNullToPost < ActiveRecord::Migration[5.2]
  def up
    change_column_null :posts, :url, true
  end

  def down
    change_column_null :posts, :url, false
  end
end

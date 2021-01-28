class RemoveNullFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :title
    remove_column :posts, :content
    remove_column :posts, :url
  end
end

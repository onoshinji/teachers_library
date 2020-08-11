class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :kind, :integer, default: 0, null: false
  end
end

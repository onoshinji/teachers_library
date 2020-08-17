class AddColumnToPostMsOffice < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :ms_office, :text
  end
end

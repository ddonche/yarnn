class AddPostToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :post, :text
  end
end
class RenamePostToContent < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :posts, :post, :content
  end

  def self.down
    rename_column :posts, :content, :post
  end
end

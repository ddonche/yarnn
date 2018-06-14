class RenameParentidToPostid < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :posts, :parent_id, :post_id
  end

  def self.down
    rename_column :posts, :post_id, :parent_id
  end
end
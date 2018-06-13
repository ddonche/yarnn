class AddParentAndShareCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :parent_id, :integer
    add_column :posts, :share_count, :integer
  end
end


class AddIndexToParentId < ActiveRecord::Migration[5.0]
  def change
    add_index :posts, :parent_id
  end
end

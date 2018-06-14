class AddDefaultToShareCount < ActiveRecord::Migration[5.0]
  def change
    change_column_default :posts, :share_count, 0
  end
end
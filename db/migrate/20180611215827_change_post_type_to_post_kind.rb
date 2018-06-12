class ChangePostTypeToPostKind < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :posts, :type, :kind
  end

  def self.down
    rename_column :posts, :kind, :type
  end
end

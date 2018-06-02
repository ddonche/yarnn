class RenameLinksToPosts < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :links, :posts
  end

  def self.down
    rename_table :posts, :links
  end
end

class RemoveSlugFromTags < ActiveRecord::Migration[5.0]
  def up
    remove_column :tags, :slug
  end

  def down
    add_column :tags, :slug, :string
  end
end

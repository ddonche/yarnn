class AddSignatureToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :signature, :text, :limit => 150
  end
end

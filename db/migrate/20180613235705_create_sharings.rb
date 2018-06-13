class CreateSharings < ActiveRecord::Migration[5.0]
  def change
    create_table :sharings do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
    add_index :sharings, :post_id
    add_index :sharings, :user_id
    add_index :sharings, [:post_id, :user_id], unique: true
  end
end

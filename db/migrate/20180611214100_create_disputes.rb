class CreateDisputes < ActiveRecord::Migration[5.0]
  def change
    create_table :disputes do |t|
      t.integer :dispute_type, :integer
      t.integer :disputer_id, :integer
      t.integer :disputed_id, :integer
      t.integer :content_type, :integer
      t.integer :content_id, :integer

      t.timestamps
    end
  end
end

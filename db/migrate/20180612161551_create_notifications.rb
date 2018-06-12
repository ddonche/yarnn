class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :recipient, index: true
      t.references :notified_by, index: true
      t.references :post, index: true
      t.references :dispute, index: true
      t.references :comment, index: true
      t.references :notation, index: true
      t.references :conversation, index: true
      t.references :message, index: true
      t.boolean :read, default: false

      t.timestamps null: false
    end
    add_foreign_key :notifications, :users, column: :recipient_id
    add_foreign_key :notifications, :users, column: :notified_by_id
    add_foreign_key :notifications, :posts
    add_foreign_key :notifications, :disputes
    add_foreign_key :notifications, :comments
    add_foreign_key :notifications, :notations
    add_foreign_key :notifications, :conversations
    add_foreign_key :notifications, :messages
  end
end

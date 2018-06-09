class AddVideoAndAudioToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :video, :string
    add_column :posts, :audio, :string
  end
end

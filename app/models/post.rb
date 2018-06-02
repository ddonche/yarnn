class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { minimum: 3, maximum: 400 }
  validates :title, presence: true
end

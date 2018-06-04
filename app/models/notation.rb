class Notation < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  
  validates :content, presence: true, length: { minimum: 3, maximum: 200 }
end
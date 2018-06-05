class Comment < ApplicationRecord
  belongs_to :post 
  belongs_to :user
  has_many :notations, dependent: :destroy
  
  validates :content, presence: true, length: { minimum: 3, maximum: 300 }
  acts_as_votable

end

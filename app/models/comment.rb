class Comment < ApplicationRecord
  belongs_to :post 
  belongs_to :user
  has_many :notations, dependent: :destroy
  
  validates :content, presence: true, length: { minimum: 3 }
  acts_as_votable

end

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :content, presence: true, length: { minimum: 3, maximum: 400 }

  acts_as_taggable
  
  def maximum_amount_of_tags
    number_of_tags = tag_list_cache_on("tags").uniq.length
    errors.add(:base, "Only 3 categories allowed") if number_of_tags > 3
  end
end

class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { minimum: 3, maximum: 400 }
  validates :title, presence: true
  
  acts_as_taggable
  
  def maximum_amount_of_tags
    number_of_tags = tag_list_cache_on("tags").uniq.length
    errors.add(:base, "Only 3 categories allowed") if number_of_tags > 3
  end
end

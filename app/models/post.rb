class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  before_save :permalink_tag
  strip_attributes
  require 'uri'

  validates :content, presence: true, length: { minimum: 3, maximum: 400 }

  acts_as_taggable
  acts_as_votable

  def maximum_amount_of_tags
    number_of_tags = tag_list_cache_on("tags").uniq.length
    errors.add(:base, "Only 1 category allowed") if number_of_tags > 1
  end

  private
  def permalink_tag 
    self.tag_list = URI.decode(self.tag_list).split(' ').join('_') unless self.tag_list.nil?
  end
end
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  strip_attributes

  validates :content, presence: true, length: { minimum: 3, maximum: 400 }
  
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioUploader
  require 'streamio-ffmpeg'

  acts_as_taggable
  ActsAsTaggableOn.force_lowercase = true
  ActsAsTaggableOn.force_parameterize = true
  acts_as_votable

  def maximum_amount_of_tags
    number_of_tags = tag_list_cache_on("tags").uniq.length
    errors.add(:base, "Only 1 category allowed") if number_of_tags > 3
  end
  
  private
    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
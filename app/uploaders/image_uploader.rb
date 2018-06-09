class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process resize_to_fit: [600, 600]

  version :thumb do
    process resize_to_fill: [200,200]
  end
end
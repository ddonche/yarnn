class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process resize_to_fill: [400, 300]

  version :thumb do
    process resize_to_fill: [200, 150]
  end
end
class VideoUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    include CarrierWave::Video
    include CarrierWave::Video::Thumbnailer
    include CarrierWave::FFmpeg

    storage :file

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    protected
    def image?(new_file)
         new_file.content_type.include? 'image'
    end
    def video?(new_file)
        new_file.content_type.include? 'video'
    end
end

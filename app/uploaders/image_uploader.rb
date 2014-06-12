# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  version :small do
    process :resize_to_fit => [600, 450]
  end
  
  version :large do
    process :resize_to_fit => [800, 600]
  end
  
  def store_dir
    "images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end

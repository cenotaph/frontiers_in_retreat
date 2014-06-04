# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  version :small do
    process :resize_to_fit => [370, 275]
  end
  
  version :large do
    process :resize_to_fit => [940, 705]
  end
  
  def store_dir
    "images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end

# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process :calculate_average_colour

  version :large do
    process :resize_to_fit => [1200, 800]
  end


  private


  def calculate_average_colour
    manipulate! do |mogrify|
      convert = MiniMagick::Tool::Convert.new
      convert << mogrify.path
      convert.resize("1x1")
      convert.extent("1x1+0+0")
      convert.depth("8")
      convert << "txt:"
      convert.call.match(/(\#[A-Z0-9]{6})/)
      model.image_color = $1.present? ? $1 : "#333333"
      return mogrify
    end
  end

end

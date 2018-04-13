class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 400]
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    [version_name, 'avatar_default.png'].compact.join('_')
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end

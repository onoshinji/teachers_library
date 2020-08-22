class UserUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :user_thumb do
    process resize_to_fit: [40, 40]
  end
  version :thumb do
    process resize_to_fit: [240, 180]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    "user.jpg"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end

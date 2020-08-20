class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog
  # storage :fog
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [800,600]

  version :user_thumb do
    process resize_to_fit: [40, 40]
  end
  version :thumb do
    process resize_to_fit: [240, 180]
  end

  # アップロード許可ファイル
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  # デフォルト画像設定
  def default_url(*args)
    "default.jpg"
  end

  # def filename
  #  "#{SecureRandom.uuid}.#{file.extension}" if original_filename.present?
  # end
end

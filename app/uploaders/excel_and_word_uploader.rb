class ExcelAndWordUploader < CarrierWave::Uploader::Base
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(doc docx csv xls xlsm pdf)
  end

  # def filename
  #  "#{SecureRandom.uuid}.#{file.extension}" if original_filename.present?
  # end
end

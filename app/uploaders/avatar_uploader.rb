class AvatarUploader < CarrierWave::Uploader::Base
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process resize_to_fit: [50, 50]
  end

  version :medium do
    process resize_to_fit: [200, 200]
  end

  version :large do
    process resize_to_fit: [400, 400]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

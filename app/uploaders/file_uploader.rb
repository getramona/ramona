class FileUploader < CarrierWave::Uploader::Base
  storage :fog

  def default_url
    ActionController::Base.helpers.asset_path('default_thumbnail.jpg')
  end

  def store_dir
    "uploads/#{model.uploadable_type.underscore}/#{model.uploadable.id}/#{mounted_as}/#{model.id}"
  end

  version :png, if: :is_psd? do
    process :generate_png!

    def full_filename(for_file)
      super.chomp(File.extname(super)).gsub('png_', '') + '.png'
    end
  end

  private

  def is_psd?(file)
    file.content_type.include?('photoshop') if file.content_type
  end

  def generate_png!
    PSD.open(current_path) do |f|
      begin
        f.image.save_as_png(current_path)
      rescue Exception => e
        model.add_error(:file, "Could not generate background png: #{e.message}")
      end
    end
  end
end

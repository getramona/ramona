require 'rails_helper'

describe FileUploader, type: :uploader do
  before do
    FileUploader.enable_processing = true
  end

  let(:upload) { create :upload }
  let(:uploader) do
    _uploader = FileUploader.new(upload, :file)

    File.open(example_psd) do |f|
      _uploader.store!(f)
    end

    _uploader
  end

  after do
    FileUploader.enable_processing = true

    uploader.remove!
  end

  context 'png' do
    it 'is created' do
      expect(uploader.versions[:png].url).to_not be_nil
    end
  end
end

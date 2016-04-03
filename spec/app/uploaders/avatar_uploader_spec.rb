require 'rails_helper'

describe AvatarUploader, type: :uploader do
  before do
    AvatarUploader.enable_processing = true
  end

  let(:user) { create :user }
  let(:uploader) do
    _uploader = AvatarUploader.new(user, :avatar)

    File.open(example_avatar) do |f|
      _uploader.store!(f)
    end

    _uploader
  end

  after do
    AvatarUploader.enable_processing = true

    uploader.remove!
  end

  context 'small' do
    it 'scales down to 50 by 50 pixels' do
      uploader.small.should be_no_larger_than(50, 50)
    end
  end

  context 'medium' do
    it 'scales down to 200 by 200 pixels' do
      uploader.medium.should be_no_larger_than(200, 200)
    end
  end

  context 'large' do
    it 'scales down to 400 by 400 pixels' do
      uploader.large.should be_no_larger_than(400, 400)
    end
  end
end

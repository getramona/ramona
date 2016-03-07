require 'rails_helper'

describe Upload, type: :model do
  let(:upload) { create :upload }

  it 'belongs to an uploadable' do
    expect(upload).to belong_to :uploadable
  end

  it 'has an uploadable' do
    expect(upload).to validate_presence_of :uploadable
  end
end

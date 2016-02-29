require 'rails_helper'

describe Garment, type: :model do
  let(:garment) { create :garment }

  it 'belongs to a line' do
    expect(garment).to belong_to :line
  end

  it 'has many garments' do
    expect(garment).to have_many :comments
  end

  it 'has many attachments' do
    expect(garment).to have_many :attachments
  end
end

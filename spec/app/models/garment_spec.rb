require 'rails_helper'

describe Garment, type: :model do
  let(:garment) { create :garment }

  it 'belongs to a line' do
    expect(garment).to belong_to :line
  end

  it 'has many uploads' do
    expect(garment).to have_many :uploads
  end

  it 'has many comments' do
    expect(garment).to have_many :comments
  end
end

require 'rails_helper'

describe Line, type: :model do
  let(:line) { create :line }

  it 'belongs to an organization' do
    expect(line).to belong_to :organization
  end

  it 'has many garments' do
    expect(line).to have_many :garments
  end

  it 'has many attachments' do
    expect(line).to have_many :attachments
  end
end

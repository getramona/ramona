require 'rails_helper'

describe Line, type: :model do
  let(:line) { create :line }

  it 'has a name if both season and year are blank' do
    empty_line = build :line, season: nil, year: nil, name: nil

    expect(empty_line).to_not be_valid
  end

  it 'belongs to an organization' do
    expect(line).to belong_to :organization
  end

  it 'has many garments' do
    expect(line).to have_many :garments
  end

  it 'has many uploads' do
    expect(line).to have_many :uploads
  end
end

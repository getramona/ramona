require 'rails_helper'

describe Organization, type: :model do
  let(:organization) { create(:organization) }

  it 'is a valid organization' do
    expect(organization).to be_valid
  end

  it 'has and belongs to many users' do
    expect(organization).to have_and_belong_to_many :users
  end

  it 'has many teams' do
    expect(organization).to have_many :teams
  end

  it 'has many lines' do
    expect(organization).to have_many :lines
  end

  it 'requires a name' do
    expect(organization).to validate_presence_of :name
  end

  it 'requires a domain' do
    expect(organization).to validate_presence_of :domain
  end
end

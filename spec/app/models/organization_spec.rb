require 'rails_helper'

describe Organization, type: :model do
  let(:organization) { create :organization }

  it 'has a name' do
    expect(organization).to validate_presence_of :name
  end

  it 'has a unique name' do
    expect(organization).to validate_uniqueness_of :name
  end

  it 'has a subdomain' do
    expect(organization).to validate_presence_of :subdomain
  end

  it 'has a unique subdomain' do
    expect(organization).to validate_uniqueness_of :subdomain
  end

  it 'has many memberships' do
    expect(organization).to have_many :memberships
  end

  it 'has many users' do
    expect(organization).to have_many(:users).through(:memberships)
  end

  it 'has many teams' do
    expect(organization).to have_many(:teams)
  end

  it 'has many lines' do
    expect(organization).to have_many :lines
  end
end

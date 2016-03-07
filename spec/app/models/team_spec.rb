require 'rails_helper'

describe Team, type: :model do
  let(:team) { create :team }

  it 'has a name' do
    expect(team).to validate_presence_of :name
  end

  it 'has a permalink' do
    expect(team).to validate_presence_of :permalink
  end

  it 'has a unique permalink in the organization' do
    expect(team).to validate_uniqueness_of(:permalink).scoped_to(:organization_id)
  end

  it 'has an organization' do
    expect(team).to validate_presence_of :organization
  end

  it 'has many memberships' do
    expect(team).to have_many :memberships
  end

  it 'has many users' do
    expect(team).to have_many(:users).through(:memberships)
  end
end

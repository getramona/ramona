require 'rails_helper'

describe Team, type: :model do
  let(:team) { create :team }

  it 'requires a name' do
    expect(team).to validate_presence_of :name
  end

  it 'belongs to an organization' do
    expect(team).to belong_to :organization
  end

  it 'has and belongs to many users' do
    expect(team).to have_and_belong_to_many :users
  end
end

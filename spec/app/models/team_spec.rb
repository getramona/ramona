require 'rails_helper'

describe Team, type: :model do
  let(:team) { create :team }

  it 'requires a name' do
    expect(team).to validate_presence_of :name
  end

  it 'belongs to an Organization' do
    relation = Team.relations['organization'].relation

    expect(relation).to eql Mongoid::Relations::Referenced::In
  end

  it 'has and belongs to many Users' do
    relation = Team.relations['users'].relation

    expect(relation).to eql Mongoid::Relations::Referenced::ManyToMany
  end
end

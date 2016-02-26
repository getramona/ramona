require 'rails_helper'

describe Organization, type: :model do
  let(:organization) { create(:organization) }

  it 'is a valid organization' do
    expect(organization).to be_valid
  end

  it 'has and belongs to many Users' do
    relation = organization.relations['users'].relation

    expect(relation).to eql Mongoid::Relations::Referenced::ManyToMany
  end

  it 'has many teams' do
    relation = organization.relations['teams'].relation

    expect(relation).to eql Mongoid::Relations::Referenced::Many
  end

  it 'requires a name' do
    expect(organization).to validate_presence_of :name
  end

  it 'requires a domain' do
    expect(organization).to validate_presence_of :domain
  end
end

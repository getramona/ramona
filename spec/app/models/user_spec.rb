require 'rails_helper'

describe User, type: :model do
  let(:user) { create(:user) }

  it 'is a valid user' do
    expect(user).to be_valid
  end

  it 'requires a username' do
    expect(user).to validate_presence_of :username
  end

  it 'requires an email' do
    expect(user).to validate_presence_of :email
  end

  it 'has and belongs to many Organizations' do
    relation = user.relations['organizations'].relation

    expect(relation).to eql Mongoid::Relations::Referenced::ManyToMany
  end

  it 'has and belongs to many Teams' do
    relation = user.relations['teams'].relation

    expect(relation).to eql Mongoid::Relations::Referenced::ManyToMany
  end
end

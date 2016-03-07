require 'rails_helper'

describe User, type: :model do
  let(:user) { create :user }

  it 'has an enum for role' do
    expect(user).to define_enum_for :role
  end

  it 'has an email' do
    expect(user).to validate_presence_of :email
  end

  it 'has a unique email' do
    expect(user).to validate_uniqueness_of :email
  end

  it 'has a username' do
    expect(user).to validate_presence_of :username
  end

  it 'has a unique username' do
    expect(user).to validate_uniqueness_of :username
  end

  it 'has many memberships' do
    expect(user).to have_many :memberships
  end

  it 'has many organizations through memberships with the group field' do
    expect(user).to have_many(:organizations).through(:memberships).source(:group)
  end

  it 'has many team through memberships with the group field' do
    expect(user).to have_many(:teams).through(:memberships).source(:group)
  end
end

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

  it 'has and belongs to many organizations' do
    expect(user).to have_and_belong_to_many :organizations
  end

  it 'has and belongs to many teams' do
    expect(user).to have_and_belong_to_many :teams
  end
end

require 'rails_helper'

describe User, type: :model do
  let(:user) { create :user }

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
end

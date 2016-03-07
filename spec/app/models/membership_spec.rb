require 'rails_helper'

describe Membership, type: :model do
  let(:membership) { create :membership }

  it 'defines an enum for role' do
    expect(membership).to define_enum_for :role
  end

  it 'has a user' do
    expect(membership).to validate_presence_of :user
  end

  it 'has a group' do
    expect(membership).to validate_presence_of :group
  end

  it 'belongs to a group' do
    expect(membership).to belong_to :group
  end

  it 'belongs to a user' do
    expect(membership).to belong_to :user
  end
end

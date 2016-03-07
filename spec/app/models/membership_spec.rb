require 'rails_helper'

describe Membership, type: :model do
  let(:membership) { create :membership }

  it 'has a user' do
    expect(membership).to validate_presence_of :user
  end

  it 'has a group' do
    expect(membership).to validate_presence_of :group
  end
end

require 'rails_helper'

describe Comment, type: :model do
  let(:comment) { create :comment }

  it 'is a valid comment' do
    expect(comment).to be_valid
  end

  it 'requires text' do
    expect(comment).to validate_presence_of :text
  end

  it 'requires a user' do
    expect(comment).to validate_presence_of :user
  end

  it 'belongs to a user' do
    expect(comment).to belong_to :user
  end

  it 'belongs to a commentable polymorphic type' do
    expect(comment).to belong_to :commentable
  end
end

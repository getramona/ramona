require 'rails_helper'

describe Comment, type: :model do
  let(:comment) { create :comment }

  it 'belongs to a commentable' do
    expect(comment).to belong_to :commentable
  end

  it 'belongs to a user' do
    expect(comment).to belong_to :user
  end

  it 'has text' do
    expect(comment).to validate_presence_of :text
  end

  it 'has a commentable' do
    expect(comment).to validate_presence_of :commentable
  end

  it 'has a user' do
    expect(comment).to validate_presence_of :user
  end
end

require 'rails_helper'

describe Inspiration, type: :model do
  let(:inspiration) { create :inspiration }

  it 'belongs to a project' do
    expect(inspiration).to belong_to :project
  end

  it 'has one upload' do
    expect(inspiration).to have_one :upload
  end

  it 'has many comments' do
    expect(inspiration).to have_many :comments
  end
end

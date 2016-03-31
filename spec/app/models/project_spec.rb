require 'rails_helper'

describe Project, type: :model do
  let(:project) { create :project }

  it 'belongs to an organization' do
    expect(project).to belong_to :organization
  end

  it 'has many garments' do
    expect(project).to have_many :garments
  end

  it 'has many uploads' do
    expect(project).to have_many :uploads
  end
end

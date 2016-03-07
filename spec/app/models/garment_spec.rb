require 'rails_helper'

describe Garment, type: :model do
  let(:garment) { create :garment }

  it 'belongs to a line' do
    expect(garment).to belong_to :line
  end
end

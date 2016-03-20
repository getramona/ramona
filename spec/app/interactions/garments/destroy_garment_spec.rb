require 'rails_helper'

describe DestroyGarment do
  let(:admin) { create :user, :admin }
  let(:garment) { create :garment }

  context 'with valid input' do
    let(:action) do
      DestroyGarment.run(
        current_user: admin,
        garment: {
          garment: garment
        }
      )
    end

    it 'is valid' do
      expect(action.valid?).to be_truthy
    end

    it 'results in a garment' do
      expect(action.result).to be_an_instance_of Garment
    end

    it 'destroys the garmnet' do
      expect(action.result.destroyed?).to be_truthy
    end
  end

  context 'with invalid input' do
    let(:action) do
      DestroyGarment.run
    end

    it 'is not valid' do
      expect(action.valid?).to be_falsey
    end

    it 'has errors' do
      expect(action.errors).to_not be_nil
    end
  end
end

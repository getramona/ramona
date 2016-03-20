require 'rails_helper'

describe UpdateGarment do
  let(:admin) { create :user, :admin }
  let(:garment) { create :garment }

  context 'with valid input' do
    let(:action) do
      UpdateGarment.run(
        current_user: admin,
        garment: {
          garment: garment,
          name: 'Shirt',
          description: 'A shirt.'
        }
      )
    end

    it 'is valid' do
      expect(action.valid?).to be_truthy
    end

    it 'results in a garment' do
      expect(action.result).to be_an_instance_of Garment
    end

    it 'sets the name' do
      expect(action.result.name).to eql 'Shirt'
    end

    it 'sets the description' do
      expect(action.result.description).to eql 'A shirt.'
    end
  end

  context 'with invalid input' do
    let(:action) do
      UpdateGarment.run
    end

    it 'is not valid' do
      expect(action.valid?).to be_falsey
    end

    it 'has errors' do
      expect(action.errors).to_not be_nil
    end
  end
end

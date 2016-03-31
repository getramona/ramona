require 'rails_helper'

describe CreateGarment do
  let(:admin) { create :user, :admin }
  let(:project) { create :project }

  context 'with valid input' do
    let(:action) do
      CreateGarment.run(
        current_user: admin,
        garment: {
          project: project,
          name: 'Tee'
        }
      )
    end

    it 'is valid' do
      expect(action.valid?).to be_truthy
    end

    it 'results in a garment' do
      expect(action.result).to be_an_instance_of Garment
    end

    it 'sets the project' do
      expect(action.result.project).to eql project
    end

    it 'sets the name' do
      expect(action.result.name).to eql 'Tee'
    end
  end

  context 'with invalid input' do
    let(:action) do
      CreateGarment.run
    end

    it 'is not valid' do
      expect(action.valid?).to be_falsey
    end

    it 'has errors' do
      expect(action.errors).to_not be_nil
    end
  end
end

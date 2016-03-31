require 'rails_helper'

describe DestroyProject do
  let(:admin) { create :user, :admin }
  let(:project) { create :project }

  context 'with valid input' do
    let(:action) do
      DestroyProject.run(
        current_user: admin,
        project: {
          project: project
        }
      )
    end

    it 'is valid' do
      expect(action.valid?).to be_truthy
    end

    it 'results in a project' do
      expect(action.result).to be_an_instance_of Project
    end

    it 'destroys the project' do
      expect(action.result.destroyed?).to be_truthy
    end
  end

  context 'with invalid input' do
    let(:action) do
      DestroyProject.run
    end

    it 'is not valid' do
      expect(action.valid?).to be_falsey
    end

    it 'has errors' do
      expect(action.errors).to_not be_nil
    end
  end
end

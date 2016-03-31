require 'rails_helper'

describe CreateProject do
  let(:admin) { create :user, :admin }
  let(:organization) { create :organization }

  context 'with valid input' do
    let(:action) do
      CreateProject.run(
        current_user: admin,
        project: {
          organization: organization,
          name: 'Spring/Summer 2016'
        }
      )
    end

    it 'is valid' do
      expect(action.valid?).to be_truthy
    end

    it 'results in a project' do
      expect(action.result).to be_an_instance_of Project
    end

    it 'sets the organization' do
      expect(action.result.organization).to eql organization
    end

    it 'sets the name' do
      expect(action.result.name).to eql 'Spring/Summer 2016'
    end
  end

  context 'with invalid input' do
    let(:action) do
      CreateProject.run
    end

    it 'is not valid' do
      expect(action.valid?).to be_falsey
    end

    it 'has errors' do
      expect(action.errors).to_not be_nil
    end
  end
end

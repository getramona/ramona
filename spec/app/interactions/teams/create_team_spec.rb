require 'rails_helper'

describe CreateTeam, type: :interaction do
  let(:admin) { create :user, :admin }
  let(:organization) { create :organization }

  context 'with valid inputs' do
    let(:action) do
      CreateTeam.run(
        current_user: admin,
        team: {
          organization: organization,
          name: 'Designers',
          permalink: generate(:permalink)
        }
      )
    end

    it 'is valid' do
      expect(action.valid?).to be_truthy
    end

    it 'results in a team' do
      expect(action.result).to be_an_instance_of Team
    end

    it 'sets the organization' do
      expect(action.result.organization).to eql organization
    end

    it 'sets the name' do
      expect(action.result.name).to eql 'Designers'
    end

    it 'sets the permalink' do
      expect(action.result.permalink).to_not be_nil
    end
  end

  context 'with invalid inputs' do
    let(:action) do
      CreateTeam.run
    end

    it 'is not valid' do
      expect(action.valid?).to be_falsey
    end

    it 'has errors' do
      expect(action.errors).to_not be_nil
    end
  end
end

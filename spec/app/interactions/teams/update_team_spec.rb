require 'rails_helper'

describe UpdateTeam, type: :interaction do
  let(:admin) { create :user, :admin }
  let(:team) { create :team }

  context 'with valid inputs' do
    let(:action) do
      UpdateTeam.run(
        current_user: admin,
        team: {
          team: team,
          name: 'Technical Designers'
        }
      )
    end

    it 'is valid' do
      expect(action.valid?).to be_truthy
    end

    it 'results in a team' do
      expect(action.result).to be_an_instance_of Team
    end

    it 'sets the name' do
      expect(action.result.name).to eql 'Technical Designers'
    end
  end

  context 'with invalid inputs' do
    let(:action) do
      UpdateTeam.run
    end

    it 'is not valid' do
      expect(action.valid?).to be_falsey
    end

    it 'has errors' do
      expect(action.errors).to_not be_nil
    end
  end
end

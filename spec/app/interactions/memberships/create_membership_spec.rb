require 'rails_helper'

describe CreateMembership, type: :interaction do
  describe '#to_model' do
    it 'returns an empty membership' do
      expect(CreateMembership.new.to_model).to be_an_instance_of Membership
    end
  end

  describe '#execute' do
    let(:admin) { create :user, :admin }
    let(:user) { create :user }

    context 'with organization' do
      let(:organization) { create :organization }
      let(:action) do
        CreateMembership.run(
          current_user: admin,
          membership: {
            user: user,
            organization: organization
          }
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'results in a membership' do
        expect(action.result).to be_an_instance_of Membership
      end

      it 'uses the correct information' do
        expect(action.result.user).to eql user
        expect(action.result.group).to eql organization
      end
    end

    context 'with team' do
      let(:team) { create :team }
      let(:action) do
        CreateMembership.run(
          current_user: admin,
          membership: {
            user: user,
            team: team
          }
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'results in a membership' do
        expect(action.result).to be_an_instance_of Membership
      end

      it 'uses the correct information' do
        expect(action.result.user).to eql user
        expect(action.result.group).to eql team
      end
    end

    context 'without group' do
      let(:action) do
        CreateMembership.run(
          current_user: admin,
          membership: {
            user: user
          }
        )
      end

      it 'is not valid' do
        expect(action.valid?).to be_falsey
      end
    end
  end
end

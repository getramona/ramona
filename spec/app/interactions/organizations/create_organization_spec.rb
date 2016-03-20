require 'rails_helper'

describe CreateOrganization, type: :interaction do
  describe '#to_model' do
    it 'returns an empty organization' do
      expect(CreateOrganization.new.to_model).to be_an_instance_of Organization
    end
  end

  describe '#execute' do
    let(:user) { create :user }

    context 'with valid inputs' do
      let(:action) do
        CreateOrganization.run(
          current_user: user,
          organization: {
            name: 'Norse Projects',
            subdomain: generate(:subdomain)
          }
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'results in an organization' do
        expect(action.result).to be_an_instance_of Organization
      end

      it 'makes the current user a leader' do
        membership = action.result.memberships.first

        expect(membership.user).to eql user
        expect(membership.leader?).to be_truthy
      end
    end

    context 'with invalid inputs' do
      let(:action) do
        CreateOrganization.run
      end

      it 'is not valid' do
        expect(action.valid?).to be_falsey
      end

      it 'has errors' do
        expect(action.errors).to_not be_nil
      end
    end
  end
end

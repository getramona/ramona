require 'rails_helper'

describe UpdateOrganization, type: :interaction do
  describe '#execute' do
    context 'with valid inputs' do
      let(:admin) { create :user, :admin }
      let(:organization) { create :organization }
      let(:action) do
        UpdateOrganization.run(
          current_user: admin,
          organization: {
            organization: organization,
            name: 'Foobar'
          }
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'results in an organization' do
        expect(action.result).to be_an_instance_of Organization
      end

      it 'changes the correct fields' do
        expect(action.result.name).to eql 'Foobar'
      end
    end

    context 'with invalid inputs' do
      let(:action) do
        UpdateOrganization.run
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

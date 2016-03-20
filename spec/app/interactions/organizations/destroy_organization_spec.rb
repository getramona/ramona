require 'rails_helper'

describe DestroyOrganization, type: :interaction do
  let(:admin) { create :user, :admin }
  let(:organization) { create :organization }

  describe '#execute' do
    context 'with valid inputs' do
      let(:action) do
        DestroyOrganization.run(
          current_user: admin,
          organization: {
            organization: organization
          }
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'destroyed the user' do
        expect(action.result.destroyed?).to be_truthy
      end
    end

    context 'without valid inputs' do
      let(:outsider) { create :user }

      let(:action) do
        DestroyOrganization.run(
          current_user: outsider,
          organization: {
            organization: organization
          }
        )
      end

      it 'is not valid' do
        expect(action.valid?).to be_falsey
      end
    end
  end
end

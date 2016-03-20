require 'rails_helper'

describe DestroyUser, type: :interaction do
  let(:user) { create :user }

  describe '#execute' do
    context 'with valid inputs' do
      let(:action) do
        DestroyUser.run(
          current_user: user,
          user: {
            user: user
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
        DestroyUser.run(
          current_user: outsider,
          user: {
            user: user
          }
        )
      end

      it 'is not valid' do
        expect(action.valid?).to be_falsey
      end

      it 'did not destroy the user' do
        expect(action.result.destroyed?).to be_falsey
      end
    end
  end
end

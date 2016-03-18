require 'rails_helper'

describe DestroyUser, type: :interaction do
  let(:user) { create :user }

  describe '#execute' do
    context 'with valid inputs' do
      let(:action) do
        DestroyUser.run(
          user: user
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'destroyed the user' do
        expect(action.result.destroyed?).to be_truthy
      end
    end
  end
end

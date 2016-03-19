require 'rails_helper'

describe UpdateUser, type: :interaction do
  let(:user) { create :user }

  describe '#execute' do
    context 'with valid inputs' do
      let(:admin) { create :user, :admin }
      let(:action) do
        UpdateUser.run(
          current_user: admin,
          user: user,
          name: 'Neil deGrasse Tyson',
          email: 'neiltyson@foo.com',
          username: 'neiltyson'
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'results in a user' do
        expect(action.result).to be_an_instance_of User
      end

      it 'changes the user\'s name' do
        expect(action.result.name).to eql 'Neil deGrasse Tyson'
      end

      it 'changes the user\'s email' do
        expect(action.result.email).to eql 'neiltyson@foo.com'
      end

      it 'changes the user\'s username' do
        expect(action.result.username).to eql 'neiltyson'
      end
    end

    context 'with invalid inputs' do
      let(:outsider) { create :user }
      let(:action) do
        UpdateUser.run(
          current_user: outsider,
          user: user,
          name: 'Neil deGrasse Tyson',
          email: 'neiltyson@foo.com',
          username: 'neiltyson'
        )
      end

      it 'is not valid' do
        expect(action.valid?).to_not be_truthy
      end

      it 'results in a user' do
        expect(action.result).to be_an_instance_of User
      end

      it 'does not change the user\'s name' do
        expect(action.result.name).to_not eql 'Neil deGrasse Tyson'
      end

      it 'does not change the user\'s email' do
        expect(action.result.email).to_not eql 'neiltyson@foo.com'
      end

      it 'does not change the user\'s username' do
        expect(action.result.username).to_not eql 'neiltyson'
      end
    end
  end
end

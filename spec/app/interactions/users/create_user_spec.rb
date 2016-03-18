require 'rails_helper'

describe CreateUser, type: :interaction do
  describe '#to_model' do
    it 'returns an empty user' do
      expect(CreateUser.new.to_model).to be_an_instance_of User
    end
  end

  describe '#execute' do
    context 'with valid inputs' do
      let(:action) do
        CreateUser.run(
          name: 'Bill Nye',
          email: generate(:email),
          username: generate(:username),
          password: 'iloveplanets'
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'results in a user' do
        expect(action.result).to be_an_instance_of User
      end
    end

    context 'with invalid inputs' do
      let(:action) do
        CreateUser.run
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

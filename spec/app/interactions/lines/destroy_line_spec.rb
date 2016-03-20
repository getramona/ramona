require 'rails_helper'

describe DestroyLine do
  let(:admin) { create :user, :admin }
  let(:line) { create :line }

  context 'with valid input' do
    let(:action) do
      DestroyLine.run(
        current_user: admin,
        line: {
          line: line
        }
      )
    end

    it 'is valid' do
      expect(action.valid?).to be_truthy
    end

    it 'results in a line' do
      expect(action.result).to be_an_instance_of Line
    end

    it 'destroys the line' do
      expect(action.result.destroyed?).to be_truthy
    end
  end

  context 'with invalid input' do
    let(:action) do
      DestroyLine.run
    end

    it 'is not valid' do
      expect(action.valid?).to be_falsey
    end

    it 'has errors' do
      expect(action.errors).to_not be_nil
    end
  end
end

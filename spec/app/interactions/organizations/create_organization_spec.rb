require 'rails_helper'

describe CreateOrganization do
  let(:interaction) do
    CreateOrganization.run(
      name: 'Test Organization',
      domain: 'test.com'
    )
  end

  describe '#execute' do
    it 'creates a new Organization' do
      expect(interaction.result).to be_an_instance_of Organization
    end
  end

  describe '#to_model' do
    it 'returns an empty Organization' do
      expect(interaction.to_model).to be_an_instance_of Organization
    end
  end
end

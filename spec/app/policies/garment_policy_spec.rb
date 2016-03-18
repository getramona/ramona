require 'rails_helper'

describe GarmentPolicy, type: :policy do
  subject { described_class }

  let(:admin)  { create :user, :admin }
  let(:garment) { create :garment }
  let(:line) { garment.line }
  let(:organization) { line.organization }
  let(:leadership) { create :membership, :leader, group: organization }
  let(:leader) { leadership.user }
  let(:membership) { create :membership, group: organization }
  let(:member) { membership.user }
  let(:outsider) { create :user }

  permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
    it 'allows admins' do
      expect(subject).to permit(admin, garment)
    end

    it 'allows members' do
      expect(subject).to permit(leader, garment)
      expect(subject).to permit(member, garment)
    end

    it 'denies outsiders' do
      expect(subject).to_not permit(outsider, garment)
    end
  end
end

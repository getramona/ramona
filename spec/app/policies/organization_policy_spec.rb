require 'rails_helper'

describe OrganizationPolicy, type: :policy do
  subject { described_class }

  let(:admin)  { create :user, :admin }
  let(:leadership) { create :membership, :leader }
  let(:leader) { leadership.user }
  let(:organization) { leadership.group }
  let(:membership) { create :membership, group: organization }
  let(:member) { membership.user }
  let(:outsider) { create :user }

  permissions :index? do
    it 'allows admins' do
      expect(subject).to permit(admin, organization)
    end

    it 'denies everyone else' do
      expect(subject).to_not permit(leader, organization)
    end
  end

  permissions :show? do
    it 'allows members' do
      expect(subject).to permit(member, organization)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, organization)
    end

    it 'denies outsiders' do
      expect(subject).to_not permit(outsider, organization)
    end
  end

  permissions :create? do
    it 'allows everyone' do
      expect(subject).to permit(outsider, organization)
    end
  end

  permissions :edit?, :update?, :destroy? do
    it 'allows leaders' do
      expect(subject).to permit(leader, organization)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, organization)
    end

    it 'denies others' do
      expect(subject).to_not permit(member, organization)
      expect(subject).to_not permit(outsider, organization)
    end
  end
end

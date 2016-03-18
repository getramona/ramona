require 'rails_helper'

describe LinePolicy, type: :policy do
  subject { described_class }

  let(:admin)  { create :user, :admin }
  let(:line) { create :line }
  let(:organization) { line.organization }
  let(:leadership) { create :membership, :leader, group: organization }
  let(:leader) { leadership.user }
  let(:membership) { create :membership, group: organization }
  let(:member) { membership.user }
  let(:outsider) { create :user }

  permissions :index?, :show? do
    it 'allows admins' do
      expect(subject).to permit(admin, line)
    end

    it 'allows members' do
      expect(subject).to permit(leader, line)
      expect(subject).to permit(member, line)
    end

    it 'denies outsiders' do
      expect(subject).to_not permit(outsider, line)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it 'allows leaders' do
      expect(subject).to permit(leader, line)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, line)
    end

    it 'denies others' do
      expect(subject).to_not permit(member, line)
      expect(subject).to_not permit(outsider, line)
    end
  end
end

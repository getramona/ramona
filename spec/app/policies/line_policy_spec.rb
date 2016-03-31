require 'rails_helper'

describe ProjectPolicy, type: :policy do
  subject { described_class }

  let(:admin)  { create :user, :admin }
  let(:project) { create :project }
  let(:organization) { project.organization }
  let(:leadership) { create :membership, :leader, group: organization }
  let(:leader) { leadership.user }
  let(:membership) { create :membership, group: organization }
  let(:member) { membership.user }
  let(:outsider) { create :user }

  permissions :index?, :show? do
    it 'allows admins' do
      expect(subject).to permit(admin, project)
    end

    it 'allows members' do
      expect(subject).to permit(leader, project)
      expect(subject).to permit(member, project)
    end

    it 'denies outsiders' do
      expect(subject).to_not permit(outsider, project)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it 'allows leaders' do
      expect(subject).to permit(leader, project)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, project)
    end

    it 'denies others' do
      expect(subject).to_not permit(member, project)
      expect(subject).to_not permit(outsider, project)
    end
  end
end

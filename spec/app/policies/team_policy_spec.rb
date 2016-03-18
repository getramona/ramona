require 'rails_helper'

describe TeamPolicy, type: :policy do
  subject { described_class }

  let(:admin)  { create :user, :admin }
  let(:team) { create :team }
  let(:organization) { team.organization }
  let(:organization_leadership) { create :membership, :leader, group: organization }
  let(:organization_leader) { organization_leadership.user }
  let(:organization_membership) { create :membership, group: organization }
  let(:organization_member) { organization_membership.user }
  let(:team_leadership) { create :membership, :leader, group: team, user: organization_leader }
  let(:team_leader) { team_leadership.user }
  let(:team_membership) { create :membership, group: team, user: organization_member }
  let(:team_member) { team_membership.user }
  let(:outsider) { create :user }

  permissions :index?, :show? do
    it 'allows organization members' do
      expect(subject).to permit(organization_member, team)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, team)
    end

    it 'denies everyone else' do
      expect(subject).to_not permit(outsider, team)
    end
  end

  permissions :new?, :create?, :destroy? do
    it 'allows organization leaders' do
      expect(subject).to permit(organization_leader, team)
    end

    it 'allows admin' do
      expect(subject).to permit(admin, team)
    end

    it 'denies everyone else' do
      expect(subject).to_not permit(organization_member, team)
      expect(subject).to_not permit(outsider, team)
    end
  end

  permissions :edit?, :update? do
    it 'allows team leaders' do
      expect(subject).to permit(team_leader, team)
    end

    it 'allows organization leaders' do
      expect(subject).to permit(organization_leader, team)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, team)
    end

    it 'denies everyone else' do
      expect(subject).to_not permit(organization_member, team)
      expect(subject).to_not permit(outsider, team)
    end
  end
end

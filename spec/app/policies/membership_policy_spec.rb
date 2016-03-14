require 'rails_helper'

describe MembershipPolicy, type: :policy do
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
    it 'allows admins' do
      expect(subject).to permit(admin, organization_membership)
      expect(subject).to permit(admin, team_membership)
    end

    it 'allows members' do
      expect(subject).to permit(organization_member, organization_membership)
      expect(subject).to permit(team_member, team_membership)
    end

    it 'denies everyone else' do
      expect(subject).to_not permit(outsider, organization_membership)
      expect(subject).to_not permit(outsider, team_membership)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it 'allows admins' do
      expect(subject).to permit(admin, organization_membership)
      expect(subject).to permit(admin, team_membership)
    end

    it 'allows leaders' do
      expect(subject).to permit(organization_leader, organization_membership)
      expect(subject).to permit(team_leader, team_membership)
    end

    it 'denies everyone else' do
      expect(subject).to_not permit(organization_member, organization_membership)
      expect(subject).to_not permit(team_member, team_membership)
      expect(subject).to_not permit(outsider, organization_membership)
      expect(subject).to_not permit(outsider, team_membership)
    end
  end
end

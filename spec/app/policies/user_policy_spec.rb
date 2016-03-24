require 'rails_helper'

describe UserPolicy, type: :policy do
  subject { described_class }

  let(:target) { build(:user) }
  let(:user)   { build(:user) }
  let(:admin)  { build(:user, :admin) }

  permissions :show?, :edit?, :update? do
    it 'allows the target' do
      expect(subject).to permit(target, target)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, target)
    end

    it 'allows people in the user\'s organizations'
  end

  permissions :destroy? do
    it 'allows admins' do
      expect(subject).to permit(admin, target)
    end

    it 'allows the target' do
      expect(subject).to permit(target, target)
    end
  end

  permissions :create?, :new? do
    it 'allows all' do
      expect(subject).to permit(User.new, User.new)
    end
  end

  describe UserPolicy::Scope do
    describe '#resolve' do
      let(:leadership) { create :membership, :leader }
      let(:leader) { leadership.user }
      let(:organization) { leadership.group }
      let(:membership) { create :membership, group: organization }
      let(:member) { membership.user }

      context 'as an admin' do
        let(:user_context) do
          UserContext.new(admin, organization)
        end

        let(:scope) do
          UserPolicy::Scope.new(user_context, User).scope
        end

        it 'returns a relation with the organization' do
          expect(scope.all).to include member
        end
      end

      context 'as a regular user' do
        let(:user_context) do
          UserContext.new(member, User)
        end

        let(:scope) do
          UserPolicy::Scope.new(user_context, User).scope
        end

        it 'returns a relation with two organizations' do
          expect(scope.all.count).to eql 2
        end
      end
    end
  end
end

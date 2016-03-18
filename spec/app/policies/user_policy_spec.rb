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
end

require 'rails_helper'

describe ApplicationPolicy, type: :policy do
  subject { described_class }

  let(:user)  { build :user }
  let(:admin) { build :user, :admin }

  permissions :index? do
    it 'denies access to non-admins' do
      expect(subject).to_not permit(user, Object.new)
    end

    it 'allows access to admins' do
      expect(subject).to permit(admin, Object.new)
    end
  end

  permissions :show? do
    it 'shows existing records' do
      expect(subject).to permit(user, create(:user))
    end
  end

  permissions :create?, :new?, :update?, :edit?, :destroy? do
    it 'denies all' do
      expect(subject).to_not permit(user, Object.new)
    end
  end
end

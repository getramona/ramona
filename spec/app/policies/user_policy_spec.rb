require 'rails_helper'

describe UserPolicy, type: :policy do
  permissions :update?, :edit?, :destroy? do
    it 'grants access if the User wants to update themselves' do
      _user = create(:user)

      expect(UserPolicy).to permit(_user, _user)
    end

    it 'grants access if an admin is updating the User' do
      _user = create(:user)
      _admin = create(:user, :admin)

      expect(UserPolicy).to permit(_admin, _user)
    end
  end
end

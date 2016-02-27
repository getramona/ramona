class UserPolicy < ApplicationPolicy
  # Note: For this policy, @user refers to the current user. @record is the
  # user we're checking to see if the current user can access.

  def update?
    @user == @record || @user.admin?
  end

  def destroy?
    update?
  end
end

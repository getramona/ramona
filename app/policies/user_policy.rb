class UserPolicy < ApplicationPolicy
  def show?
    @user == @record or @user.admin?
  end

  def create?
    true
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    @user == @record or @user.admin?
  end

  class Scope < Scope
  end
end

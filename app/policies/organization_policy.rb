class OrganizationPolicy < ApplicationPolicy
  def show?
    member? or admin?
  end

  def create?
    true
  end

  def edit?
    leader? or admin?
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def leader?
    Membership.where(group: @record, user: @user, role: :leader).exists?
  end

  def member?
    Membership.where(group: @record, user: @user).exists?
  end

  class Scope < Scope
  end
end

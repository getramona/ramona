class LinePolicy < ApplicationPolicy
  def index?
    organization_member? || admin?
  end

  def show?
    index?
  end

  def new?
    organization_leader? || admin?
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end

  def organization
    @record.organization
  end

  def organization_leader?
    Membership.where(group: organization, user: @user, role: :leader).exists?
  end

  def organization_member?
    Membership.where(group: organization, user: @user).exists?
  end


  class Scope < Scope
  end
end

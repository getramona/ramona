class TeamPolicy < ApplicationPolicy
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
    team_leader? || organization_leader? || admin?
  end

  def update?
    edit?
  end

  def destroy?
    new?
  end

  def team_leader?
    Membership.where(group: @record, user: @user, role: :leader).exists?
  end

  def team_member?
    Membership.where(group: @record, user: @user).exists?
  end

  def organization_leader?
    Membership.where(group: organization, user: @user, role: :leader).exists?
  end

  def organization_member?
    Membership.where(group: organization, user: @user).exists?
  end

  def organization
    @record.organization
  end

  class Scope < Scope
  end
end

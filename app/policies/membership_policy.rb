class MembershipPolicy < ApplicationPolicy
  def index?
    organization_member? || team_member? || admin?
  end

  def show?
    index?
  end

  def new?
    empty_organization? || organization_leader? || team_leader? || admin?
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

  def organization_leader?
    organization? && Membership.where(group: @record.group, user: @user, role: :leader).exists?
  end

  def team_leader?
    team? && Membership.where(group: @record.group, user: @user, role: :leader).exists?
  end

  def organization_member?
    organization? && Membership.where(group: @record.group, user: @user).exists?
  end

  def team_member?
    team? && Membership.where(group: @record.group, user: @user).exists?
  end

  def empty_organization?
    organization? && Membership.where(group: @record.group).empty?
  end

  def organization?
    @record.group_type == 'Organization'
  end

  def team?
    @record.group_type == 'Team'
  end

  class Scope < Scope
  end
end

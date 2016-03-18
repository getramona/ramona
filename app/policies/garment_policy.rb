class GarmentPolicy < ApplicationPolicy
  def index?
    organization_member? || admin?
  end

  def show?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

  def organization
    @record.line.organization
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

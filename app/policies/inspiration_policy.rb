class InspirationPolicy < ApplicationPolicy
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
    @record.project.organization
  end

  def organization_leader?
    Membership.where(group: organization, user: @user, role: :leader).exists?
  end

  def organization_member?
    Membership.where(group: organization, user: @user).exists?
  end

  def pundit_user
    UserContext.new(current_user, current_organization)
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(project_id: record.project.organizations.projects.pluck(:id))
      end
    end
  end
end

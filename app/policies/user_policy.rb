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

  def pundit_user
    UserContext.new(current_user, current_organization, current_team)
  end

  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        ids = Membership.where(
          group_id: @user.organization,
          group_type: 'Organization'
        ).pluck(:user_id)

        scope.where(id: ids)
      end
    end
  end
end

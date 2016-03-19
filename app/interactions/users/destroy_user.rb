class DestroyUser < ApplicationInteraction
  object :current_user, class: User
  object :user

  def execute
    authorize(current_user, user, :destroy?)

    return user unless errors.messages.empty?

    user.destroy

    user
  end
end

class DestroyUser < ApplicationInteraction
  object :current_user, class: User
  hash :user do
    object :user
  end

  def execute
    _user = user[:user]

    authorize(current_user, _user, :destroy?)

    return _user unless errors.messages.empty?

    _user.destroy

    _user
  end
end

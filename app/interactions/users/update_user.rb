class UpdateUser < ApplicationInteraction
  object :current_user, class: User
  object :user
  string :email, :name, :username, default: nil

  def execute
    authorize(current_user, user, :update?)

    return user unless errors.messages.empty?

    user.email    = email    if email?
    user.name     = name     if name?
    user.username = username if username?

    unless user.save
      errors.merge!(user.errors)
    end

    user
  end
end

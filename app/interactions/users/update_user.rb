class UpdateUser < ApplicationInteraction
  object :current_user, class: User
  hash :user do
    object :user
    string :email, :name, :username, default: nil
  end

  def execute
    _user = user[:user]

    authorize(current_user, _user, :update?)

    return _user unless errors.messages.empty?

    _user.email    = user[:email]    if user[:email]
    _user.name     = user[:name]     if user[:name]
    _user.username = user[:username] if user[:username]

    unless _user.save
      errors.merge!(_user.errors)
    end

    _user
  end
end

class CreateUser < ApplicationInteraction
  object :current_user, class: User, default: nil
  hash :user do
    string :email, :name, :username, :password
  end

  def to_model
    User.new
  end

  def execute
    _user = User.new

    authorize(current_user, _user, :create?)

    return _user unless errors.messages.empty?

    _user.update_attributes(user.except(:user))

    unless _user.save
      errors.merge!(_user.errors)
    end

    _user
  end
end

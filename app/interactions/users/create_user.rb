class CreateUser < ApplicationInteraction
  object :current_user, class: User, default: nil
  string :email, :name, :username, :password

  def to_model
    User.new
  end

  def execute
    user = User.new

    authorize(current_user, user, :create?)

    return user unless errors.messages.empty?

    user.update_attributes(
      email: email,
      name: name,
      username: username,
      password: password
    )

    unless user.save
      errors.merge!(user.errors)
    end

    user
  end
end

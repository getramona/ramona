class UpdateUser < ActiveInteraction::Base
  object :user
  string :email, :name, :username, default: nil

  def execute
    user.email    = email    if email?
    user.name     = name     if name?
    user.username = username if username?

    unless user.save
      errors.merge!(user.errors)
    end

    user
  end
end

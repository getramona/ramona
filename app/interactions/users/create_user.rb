class CreateUser < ActiveInteraction::Base
  string :email, :name, :username, :password

  def to_model
    User.new
  end

  def execute
    user = User.new(inputs)

    unless user.save
      errors.merge!(user.errors)
    end

    user
  end
end

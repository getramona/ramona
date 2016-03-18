class CreateUser < ActiveInteraction::Base
  string :email, :name, :username, :password

  def to_model
    User.new
  end

  def execute
    _user = User.new(inputs)

    unless _user.save
      errors.merge!(_user.errors)
    end

    _user
  end
end

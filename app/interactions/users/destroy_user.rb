class DestroyUser < ActiveInteraction::Base
  object :user

  def execute
    user.destroy

    user
  end
end

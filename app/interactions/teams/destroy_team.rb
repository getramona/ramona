class DestroyTeam < ApplicationInteraction
  object :current_user, class: User
  hash :team do
    object :team
  end

  def to_model
    team[:team]
  end

  def execute
    _team = team[:team]

    authorize(current_user, _team, :destroy?)

    return nil unless errors.messages.empty?

    _team.destroy
    
    _team
  end
end

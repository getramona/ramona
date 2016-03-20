class UpdateTeam < ApplicationInteraction
  object :current_user, class: User
  hash :team do
    object :team
    string :name, default: nil
    string :permalink, default: nil
  end

  def to_model
    team[:team]
  end

  def execute
    _team = team[:team]

    authorize(current_user, _team, :update?)

    return nil unless errors.messages.empty?

    _team.name = team[:name] if team[:name]
    _team.permalink = team[:peramlink] if team[:peramlink]

    unless _team.save
      errors.merge!(_team.errors)
    end

    _team
  end
end

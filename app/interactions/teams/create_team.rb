class CreateTeam < ApplicationInteraction
  object :current_user, class: User
  hash :team do
    object :organization
    string :name
    string :permalink
  end

  def to_model
    Team.new
  end

  def execute
    _team = Team.new(team)

    authorize(current_user, _team, :create?)

    return nil unless errors.messages.empty?

    unless _team.save
      errors.merge!(_team.errors)
    end

    _team
  end
end

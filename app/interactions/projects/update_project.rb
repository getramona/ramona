class UpdateProject < ApplicationInteraction
  object :current_user, class: User
  hash :project do
    object :project
    string :name, default: nil
  end

  def to_model
    project[:project]
  end

  def execute
    _project = project[:project]

    authorize(current_user, _project, :update?)

    return nil unless errors.messages.empty?

    _project.name = project[:name] if project[:name]
    _project.season = project[:season] if project[:season]
    _project.year = project[:year] if project[:year]

    unless _project.save
      errors.merge!(_project.errors)
    end

    _project
  end
end

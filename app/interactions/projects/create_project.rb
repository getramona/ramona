class CreateProject < ApplicationInteraction
  object :current_user, class: User
  hash :project do
    object :organization
    string :name
  end

  def to_model
    Project.new
  end

  def execute
    _project = Project.new(project)

    authorize(current_user, _project, :create?)

    return nil unless errors.messages.empty?

    unless _project.save
      errors.merge!(_project.errors)
    end

    _project
  end
end

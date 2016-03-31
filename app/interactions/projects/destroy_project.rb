class DestroyProject < ApplicationInteraction
  object :current_user, class: User
  hash :project do
    object :project
  end

  def to_model
    project[:project]
  end

  def execute
    _project = project[:project]

    authorize(current_user, _project, :destroy?)

    return nil unless errors.messages.empty?

    _project.destroy

    _project
  end
end

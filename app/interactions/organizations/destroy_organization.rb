class DestroyOrganization < ApplicationInteraction
  object :current_user, class: User
  hash :organization do
    object :organization
  end

  def to_model
    organization[:organization]
  end

  def execute
    _organization = organization[:organization]

    authorize(current_user, _organization, :destroy?)

    return nil unless errors.messages.empty?

    _organization.destroy

    _organization
  end
end

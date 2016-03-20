class UpdateOrganization < ApplicationInteraction
  object :current_user, class: User
  hash :organization do
    object :organization
    string :name, default: nil
    string :subdomain, default: nil
  end

  def to_model
    organization[:organization]
  end

  def execute
    _organization = organization[:organization]

    authorize(current_user, _organization, :update?)

    return nil unless errors.messages.empty?

    _organization.name = organization[:name] if organization[:name]
    _organization.subdomain = organization[:subdomain] if organization[:subdomain]

    unless _organization.save
      errors.merge!(_organization.errors)
    end

    _organization
  end
end

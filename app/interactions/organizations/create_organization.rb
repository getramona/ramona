class CreateOrganization < ApplicationInteraction
  object :current_user, class: User
  hash :organization do
    string :name
    string :subdomain
  end

  def to_model
    Organization.new
  end

  def execute
    _organization = Organization.new

    authorize(current_user, _organization, :create?)

    return nil unless errors.messages.empty?

    _organization.update_attributes(organization)

    unless _organization.save
      errors.merge!(_organization.errors)
    end

    CreateMembership.run(
      current_user: current_user,
      membership: {
        user: current_user,
        organization: _organization,
        role: 'leader'
      }
    )

    _organization
  end
end

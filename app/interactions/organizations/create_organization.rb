class CreateOrganization < ActiveInteraction::Base
  string :name
  string :domain

  def to_model
    ::Organization.new
  end

  def execute
    organization = Organization.new(inputs)
    errors.merge!(organization.errors) unless organization.save
    organization
  end
end

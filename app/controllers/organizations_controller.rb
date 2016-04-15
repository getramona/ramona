class OrganizationsController < ApplicationController
  def index
    @organizations = current_user.organizations.order('name asc')

    render layout: 'card'
  end

  def show
    @projects = current_organization.projects.order('updated_at desc')
  end
end

class OrganizationsController < ApplicationController
  def index
    @organizations = current_user.organizations.order('name asc')
  end

  def show
  end
end

class ProjectsController < ApplicationController
  before_action :find_projects, only: [ :index ]

  def index
    d { "foo" }
  end

  protected

  def find_projects
    @projects ||= current_organization.projects
    @projects
  end
end

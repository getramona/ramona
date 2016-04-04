# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  name            :string
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ProjectsController < ApplicationController
  before_action :find_projects, only: [ :index ]
  before_action :find_project, except: [ :index, :new, :create ]

  def index
  end

  def show
    @garments = @project.garments.order('updated_at desc')
  end

  def new
    @project = CreateProject.new.to_model
  end

  def create
    _project = CreateProject.run(
      current_user: current_user,
      project: {
        organization: current_organization,
        name: project_params[:name]
      }
    )

    if _project.valid?
      redirect_to _project.result
    else
      @project = _project

      render action: :new
    end
  end

  protected

  def project_params
    params.require(:project).permit(:name)
  end

  def find_projects
    @projects ||= current_organization.projects
    @projects
  end

  def find_project
    @project ||= Project.find(params[:id])
    @project
  end
end

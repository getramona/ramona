class SpecificationsController < ApplicationController
  before_action :find_project, :find_specification

  def index
    @specifications = @project.specifications
    @specification = Specification.new
  end

  def create
    specification = Specification.new(specifications_params)
    specification.project = @project
    specification.save

    redirect_to project_specifications_url(project_id: @project.id)
  end

  def destroy
    @specification.destroy

    redirect_to project_specifications_url(project_id: @project.id)
  end

  protected

  def specifications_params
    params.require(:specification).permit(:pom, :measurement)
  end

  def find_project
    @project ||= Project.find(params[:project_id])
    @project
  end

  def find_specification
    id = params[:id] || params[:specification_id]

    if id
      @specification ||= Specification.find(id)
      @specification
    end
  end
end

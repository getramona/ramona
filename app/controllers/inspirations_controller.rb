class InspirationsController < ApplicationController
  before_action :find_project

  def index
    @inspirations ||= Inspiration.where(project_id: @project.id).order('updated_at desc')
    @inspirations
  end

  protected

  def find_project
    @project ||= Project.find(params[:project_id])
    @project
  end
end

class InspirationsController < ApplicationController
  before_action :find_project

  def index
    @inspirations ||= Inspiration.where(project_id: @project.id).order('updated_at desc')
    @inspirations
  end

  def create
    inspiration = Inspiration.new
    inspiration.project = @project
    inspiration.save

    upload = Upload.new
    upload.uploadable = inspiration
    upload.file = params[:file]
    upload.save

    redirect_to project_inspirations_url(project_id: @project.id)
  end

  protected

  def find_project
    @project ||= Project.find(params[:project_id])
    @project
  end
end

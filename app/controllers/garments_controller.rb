class GarmentsController < ApplicationController
  before_action :find_project, :find_garment

  def index
    @garments ||= Garment.where(project_id: @project.id).order('updated_at desc')
    @garments
  end

  def show
  end

  def add_upload
    upload = Upload.new
    upload.uploadable = @garment
    upload.file = params[:file]
    upload.save

    redirect_to project_garment_url(project_id: @project.id, id: @garment.id)
  end

  protected

  def find_project
    @project ||= Project.find(params[:project_id])
    @project
  end

  def find_garment
    id = params[:id] || params[:garment_id]

    if id
      @garment ||= Garment.find(id)
      @garment
    end
  end
end

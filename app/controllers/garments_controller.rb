class GarmentsController < ApplicationController
  before_action :find_project, :find_garment

  def index
    @garments ||= Garment.where(project_id: @project.id).order('updated_at desc')
    @garments
  end

  def new
    @garment = Garment.new
  end

  def show
  end

  def edit
  end

  def update
    @garment.update_attributes(garment_params)
    @garment.save

    redirect_to project_garment_url(project_id: @project.id, id: @garment.id)
  end

  def create
    garment = Garment.new(garment_params)
    garment.project = @project
    garment.save

    redirect_to project_garment_url(project_id: @project.id, id: garment.id)
  end

  def add_upload
    upload = Upload.new
    upload.uploadable = @garment
    upload.file = params[:file]
    upload.save

    redirect_to project_garment_url(project_id: @project.id, id: @garment.id)
  end

  def destroy
    @garment.destroy

    redirect_to project_garments_url(project_id: @project.id)
  end

  protected

  def garment_params
    params.require(:garment).permit(:name, :description, :sku, :approval_status)
  end

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

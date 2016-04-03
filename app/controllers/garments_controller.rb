class GarmentsController < ApplicationController
  before_action :find_project

  def index
  end

  protected

  def find_project
    @project ||= Project.find(params[:project_id])
    @project
  end
end

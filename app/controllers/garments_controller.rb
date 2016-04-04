# == Schema Information
#
# Table name: garments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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

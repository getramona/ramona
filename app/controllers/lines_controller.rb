class LinesController < ApplicationController
  before_action :find_lines, only: [ :index ]

  def index
    d { "foo" }
  end

  protected

  def find_lines
    @lines ||= current_organization.lines
    @lines
  end
end

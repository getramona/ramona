class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Get organization by subdomain.
  def current_organization
    @current_organization ||= Organization.find_by_subdomain(request.subdomain)
    @current_organization
  end
end

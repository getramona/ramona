class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # FIXME: Being a pain
  # protect_from_forgery with: :exception

  def default_url_options
    { subdomain: request.subdomain }
  end

  before_action :require_login, :current_organization

  private

  def not_authenticated
    redirect_to login_url
    d { "not authenticated" }
  end

  # Get organization by subdomain.
  def current_organization
    unless request.subdomain == 'app'
      @current_organization ||= Organization.find_by_subdomain(request.subdomain)
      @current_organization
    end
  end

  # Check if there's an organization.
  def current_organization?
    !current_organization.nil?
  end
end

class JoinController < ApplicationController

  # GET /join
  def start
    redirect_to join_user_url
  end

  # GET /join/you
  def user
    return redirect_to join_verify_url if logged_in?
  end

  # GET /join/you/verify
  def verify
    # verify if there's a token
    # otherwise show "check your email" message
  end

  # GET /join/organization
  def organization
    if current_organization
      return redirect_to root_path(subdomain: current_organization.subdomain)
    end
  end

  # GET /join/organization/invite
  def invite
  end
end

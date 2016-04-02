class UsersController < ApplicationController
  def index
    @users = current_organization.users
  end

  def create
  end

  def edit
  end

  def account
  end

  def update
  end

  def destroy
  end
end

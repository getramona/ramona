class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  layout 'card'

  # GET /login
  def new
  end

  # GET /sessions/create
  def create
    if @user = login(user_params[:email], user_params[:password])
      redirect_back_or_to root_url
    else
      redirect_to login_url
    end
  end

  # GET /logout
  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

class SessionsController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]
  # we dont want users who are logged in to try to login again
  before_action :require_logged_in, only: [:destroy]
  # we only want logged in users to logout
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      # flash[:errors] = @user.errors.full_messages <-- won't work. @user is nil
      flash.now[:errors] = ['Invalid credentials']
      # redirect_to new_session_url
      render :new
    end
  end

  def destroy
    if logged_in?
      logout!
    end

    # flash.now[:success] = ['Successfully logged out'] <-- won't work when redirecting
    flash[:success] = ['Successfully logged out']
    redirect_to new_session_url 
  end

end
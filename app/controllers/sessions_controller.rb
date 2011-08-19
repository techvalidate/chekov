class SessionsController < ApplicationController
  def login
  end

  def authorize
    if user = User.authenticate(params[:email])
      login_as user
      redirect_to root_url
    else
      flash[:error] = 'Invalid email'
      redirect_to login_url
    end
  end

  def logout
    reset_session
    redirect_to login_url
  end

end

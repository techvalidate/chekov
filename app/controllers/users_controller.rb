class UsersController < ApplicationController
  before_filter :find_current_release
  
  # GET /users/:id
  def show
    if params[:user_id]
      @user = User.find params[:user_id]
    else
      @user = current_user
    end
  end

end

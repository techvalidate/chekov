class AssignmentsController < ApplicationController
  before_filter :find_current_release
  
  # POST /assignments
  def create
    Assignment.toggle! User.find(params[:user_id]), Context.find(params[:context_id]), params[:browser]
    render nothing: true
  end

end

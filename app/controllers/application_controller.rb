class ApplicationController < ActionController::Base
  include AuthorizationSystem
  
  protect_from_forgery
  
  before_filter :login_required
  
  
  protected
  def find_current_release
    @release = Release.current
  end
  
  protected
  def find_context
    @context = @release.contexts.find params[:context_id]
  end
  
end

class ApplicationController < ActionController::Base
  include AuthorizationSystem
  
  protect_from_forgery
  
  before_filter :login_required
end

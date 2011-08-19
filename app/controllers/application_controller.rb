class ApplicationController < ActionController::Base
  include AuthorizationSystem
  
  protect_from_forgery
end

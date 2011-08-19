module AuthorizationSystem
  attr_accessor :current_user
  
  def self.included(base)
    base.__send__ :helper_method, :logged_in?, :current_user
  end
  
  protected
  
  def login_as(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def logged_in?
    !@current_user.nil?
  end
  
  def login_required
    session_login
    access_denied unless logged_in?
  end
  
  def access_denied
    redirect_to login_url and return false
  end
  
  def session_login
    login_as(User.find(session[:user_id])) if session[:user_id]
    logged_in?
  end
  
end
  
  
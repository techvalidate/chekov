require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test '/login' do
    get :login
    assert_response :success
  end

  test '/authorize with valid email' do
    post :authorize, :email=>users(:jordan).email
    assert_equal users(:jordan).id, session[:user_id]
    assert_redirected_to root_path
  end
  
  test '/authorize with invalid email' do
    post :authorize, :email=>'fake'
    assert_nil session[:user_id]
    assert flash[:error]
    assert_redirected_to login_path
  end

  test '/logout' do
    login_as :jordan
    get :logout
    assert_nil session[:user_id]
    assert_redirected_to login_path
  end

end

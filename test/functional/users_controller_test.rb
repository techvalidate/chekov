require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
  end
  
  test '/users/:id' do
    get :show, id: @current_user
    assert_response :success
  end

end

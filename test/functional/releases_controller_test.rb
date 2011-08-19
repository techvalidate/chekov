require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
  end
  
  
  test '/' do
    get :index
    assert_response :success
  end
  
  test '/release/new' do
    get :new
    assert_response :success
  end
  
  test '/release with valid params and POST' do
    assert_difference('Release.count', 1) do
      post :create, release: {name: 'New'}
      assert_redirected_to root_path 
    end
  end
  
  test '/release with invalid params and POST' do
    assert_no_difference('Release.count') do
      post :create, release: {name: ''}
      assert_response :success
    end
  end
  
  
end

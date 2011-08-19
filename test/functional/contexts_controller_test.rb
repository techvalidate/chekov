require 'test_helper'

class ContextsControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
  end

  test '/' do
    get :index
    assert_response :success
  end

  test '/contexts/:id' do
    get :show, id: contexts(:app)
    assert_response :success
  end

  test '/contexts/new' do
    get :new
    assert_response :success
  end
  
  test '/contexts with valid params and POST' do
    assert_difference('Context.count') do
      post :create, context: {name: 'New'}
      assert_equal releases(:beta), assigns(:context).release
      assert_redirected_to assigns(:context)
    end
  end
  
  test '/contexts with invalid params and POST' do
    assert_no_difference('Context.count') do
      post :create, context: {name: ''}
      assert_response :success
    end
  end

end

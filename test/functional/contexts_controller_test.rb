require 'test_helper'

class ContextsControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
    @release = releases(:beta)
  end

  test '/releases/:release_id/contexts/:id' do
    get :show, release_id: @release.id, id: contexts(:app)
    assert_response :success
  end

  test '/releases/:release_id/contexts/new' do
    get :new, release_id: @release.id
    assert_response :success
  end
  
  test '/releases/:release_id/contexts with valid params and POST' do
    assert_difference('Context.count') do
      post :create, release_id: @release.id, context: {name: 'New'}
      assert_equal @release, assigns(:context).release
      assert_redirected_to [@release, assigns(:context)]
    end
  end
  
  test '/releases/:release_id/contexts with invalid params and POST' do
    assert_no_difference('Context.count') do
      post :create, release_id: @release.id, context: {name: ''}
      assert_response :success
    end
  end

end

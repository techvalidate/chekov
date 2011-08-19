require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
    @context = contexts(:app)
  end

  test '/contexts/:context_id/stories/new' do
    get :new, context_id: @context.id
    assert_response :success
  end
  
  test '/contexts/:context_id/stories with valid params and POST' do
    assert_difference('Story.count') do
      post :create, context_id: @context.id, story: {description: 'New'}
      assert_equal @context, assigns(:story).context
      assert_redirected_to @context
    end
  end
  
  test '/contexts/:context_id/stories with invalid params and POST' do
    assert_no_difference('Story.count') do
      post :create, context_id: @context.id, story: {description: ''}
      assert_response :success
    end
  end

end

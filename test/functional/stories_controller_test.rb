require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
    @context = contexts(:app)
  end
  
  test '/context/:context_id/stories/:id' do
    get :show, context_id: @context.id, id: stories(:create_user)
    assert_response :success
  end

  test '/contexts/:context_id/stories/new' do
    get :new, context_id: @context.id
    assert_response :success
  end
  
  test '/contexts/:context_id/stories with valid params and POST' do
    skip 'Rails 4'
    assert_difference('Story.count') do
      assert_difference('Element.count') do
        post :create, context_id: @context.id, story: {name: 'New', description: '', elements_attributes: {0=>{description: 'Element'}}}
        assert_equal @context, assigns(:story).context
        assert_equal 1, assigns(:story).elements.count
        assert_redirected_to @context
      end
    end
  end
  
  test '/contexts/:context_id/stories with invalid params and POST' do
    assert_no_difference('Story.count') do
      post :create, context_id: @context.id, story: {name: ''}
      assert_response :success
    end
  end
  
  test '/context/:context_id/stories/:id with valid params and PUT' do
    story = stories(:create_user)
    put :update, context_id: @context.id, id: story, story: {description: 'Updated'}
    assert_equal 'Updated', story.reload.description
    assert_redirected_to @context
  end

end

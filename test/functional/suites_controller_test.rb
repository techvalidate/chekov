require 'test_helper'

class SuitesControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
    @story = stories(:create_project)
    @context = @story.context
  end
  
  test '/contexts/:context_id/stories/:story_id/suites/new with no suite' do
    get :new, context_id: @context.id, story_id: @story.id
    assert_response :success
  end
  
  test '/contexts/:context_id/stories/:story_id/suites/new with existing suite' do
    get :new, context_id: contexts(:app).id, story_id: stories(:create_user).id
    assert_redirected_to context_story_suite_path(contexts(:app), stories(:create_user), suites(:jordan_create_user))
  end
  
  test '/contexts/:context_id/stories/:story_id/suites' do
    assert_difference('Suite.count') do
      post :create, context_id: @context.id, story_id: @story.id, suite:{ }
      assert_equal users(:jordan), assigns(:suite).user
      assert_redirected_to contexts(:app)
    end
  end

end

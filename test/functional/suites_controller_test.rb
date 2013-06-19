require 'test_helper'

class SuitesControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
  end
  
  test '/contexts/:context_id/stories/:story_id/suites/:id' do
    suite = suites(:jordan_create_user)
    story = suite.story
    context = story.context
    get :show, context_id: context.id, story_id: story.id, id: suite.id
    assert_response :success
  end
  
  test '/contexts/:context_id/stories/:story_id/suites/new with no suite' do
    story = stories(:create_project)
    context = story.context
    get :new, context_id: context.id, story_id: story.id
    assert_response :success
  end
  
  test '/contexts/:context_id/stories/:story_id/suites/new with existing suite' do
    story = stories(:create_user)
    context = story.context
    get :new, context_id: context.id, story_id: story.id, suite: {browser: 'ff'}
    assert_redirected_to context_story_suite_path(context, story, suites(:jordan_create_user))
  end
  
  test '/contexts/:context_id/stories/:story_id/suites' do
    story = stories(:create_project)
    context = story.context
    assert_difference('Suite.count') do
      post :create, context_id: context.id, story_id: story.id, suite:{browser: 'ie10' }
      assert_equal @current_user, assigns(:suite).user
      assert_redirected_to contexts(:app)
    end
  end
  
  test '/contexts/:context_id/stories/:story_id/suites/:id with PUT' do
    skip 'Rails 4'
    suite = suites(:jordan_create_user)
    story = suite.story
    context = story.context
    check = checks(:jordan_user_attributes)
    put :update, context_id: context.id, story_id: story.id, id: suite, 
      suite: {'checks_attributes'=>{1=>{passed: true, id: check.id}} }
    assert check.reload.passed
    assert_redirected_to context
  end

end

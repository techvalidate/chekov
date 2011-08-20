require 'test_helper'

class SuitesControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
    @story = stories(:create_user)
    @context = @story.context
  end
  
  
  test '/contexts/:context_id/stories/:story_id/suites/new' do
    get :new, context_id: @context.id, story_id: @story.id
    assert_response :success
  end

end

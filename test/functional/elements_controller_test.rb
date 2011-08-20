require 'test_helper'

class ElementsControllerTest < ActionController::TestCase
  def setup
    login_as :jordan
  end

  test '/elements/:id' do
    assert_difference('Element.count', -1) do
      delete :destroy, id: elements(:new_user_record)
      assert_redirected_to context_story_path(contexts(:app), stories(:create_user))
    end
  end

end

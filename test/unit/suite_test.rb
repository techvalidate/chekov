require 'test_helper'

class SuiteTest < ActiveSupport::TestCase

  test 'location' do
    assert_equal suites(:jordan_create_user), Suite.locate(stories(:create_user), users(:jordan), :ff)
    assert Suite.locate(stories(:create_project), users(:jordan), :chrome).new_record?
  end

end

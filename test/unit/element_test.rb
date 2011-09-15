require 'test_helper'

class ElementTest < ActiveSupport::TestCase
  test 'add checks to existing suites on append to story' do
    element = stories(:create_user).elements.build :description=>'new element'
    element.save
    assert_equal 3, stories(:create_user).reload.elements.count
    assert_equal 3, suites(:jordan_create_user).checks.count
  end
end

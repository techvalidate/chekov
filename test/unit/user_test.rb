require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test 'valid authentication' do
    assert_equal users(:jordan), User.authenticate(users(:jordan).email)
  end
  
  test 'invalid authentication' do
    assert_nil User.authenticate('fake')
    assert_nil User.authenticate(nil)
  end
  
  
end

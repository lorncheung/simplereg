require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_should_be_valid
    user = User.new
    user.email = "dummy@foo.com"
    user.password = "testpass"
    user.password_confirmation ="testpass"
    assert user.valid?
  end
  
  def test_should_be_invalid
    assert User.new.invalid?
  end 
  
end

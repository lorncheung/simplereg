require 'test_helper'

class ActivationTest < ActiveSupport::TestCase
  def test_should_be_valid
    act = Activation.new 
    act.email = 'dummy@test.com'
    assert act.valid?
  end
end

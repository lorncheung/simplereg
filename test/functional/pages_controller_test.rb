require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_home 
    get :home 
    assert_template 'home'
  end
end

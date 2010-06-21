require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create user session" do
    post :create, :user_session => { :email => "sjobs@apple.com", :password => "iluvflash" }
    assert user_session = UserSession.find
    assert_equal users(:steve), user_session.user
    assert_redirected_to root_url
  end
  
  test "should destroy user session" do
    delete :destroy
    assert_nil UserSession.find
    assert_redirected_to root_url
  end
  
end

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_redirected_to new_activation_url
  end

  def test_new_with_activation_code
    get :new, :activation_code => "ACTIVATION_CODE"
    assert_template 'new'
  end
  
  def test_create_invalid
    @request.session[:activation_code] = 'ACTIVATION_CODE'

    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    UserSession.create(users(:steve))
    @request.session[:activation_code] = 'ACTIVATION_CODE'
    
    post :create
    assert_response :success
    
#    assert_redirected_to edit_user_url(users(:steve).id)
  end
  
  def test_edit
    UserSession.create(users(:steve))
    get :edit
    assert_response :success
    assert_template 'edit'
  end
  
  def test_update_invalid
    UserSession.create(users(:steve))
    put :update, :id => users(:steve), :user => {:email => ""}
    assert_template 'edit'
  end
  
  def test_update_valid
    UserSession.create(users(:steve))
    put :update, :id => users(:steve), :user => {:last_name => "Jobs"}
    assert_redirected_to root_url
  end
  

  
end

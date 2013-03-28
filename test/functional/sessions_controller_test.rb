require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "session is destroyed on signout" do    
    delete :destroy, {:id => "current"}, {:user_id => 1}
    assert_nil session[:user_id]

    # It seems ApplicationController methods are not
    # accessible here.
    #assert_nil current_user
  end

  test "session is created on sign-in" do    
    assert_equal 0, User.count
    user = FactoryGirl.create(:user)
    post :create, {
      :email => "dinerone@example.org",
      :password => "abc123"
    }

    assert_equal 1, session[:user_id]
    #assert_equal user, current_user
  end

  test "login form is displayed" do
    get :new
    assert_select "label", "Email address"
    assert_select "label", "Password"
  end
end
#
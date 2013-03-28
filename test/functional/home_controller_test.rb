require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "shows sign up/in links when not signed in" do
    get :home
    assert_response :success
    assert_select '#login ul li a', 'Sign up'
    assert_select '#login ul li a', 'Sign in'
  end

  test "shows sign out link when signed in" do
    assert_equal 0, User.count
    FactoryGirl.create(:user)
    # Note: The 3rd parameter to "get" is the session.
    # See http://guides.rubyonrails.org/testing.html
    get :home, {}, { :user_id => 1 }
    assert_response :success
    assert_select '#login a', 'Sign out'
  end
end

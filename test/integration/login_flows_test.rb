require 'test_helper'

class LoginFlowsTest < ActionDispatch::IntegrationTest
  test "user is redirected to home after signing in" do
    FactoryGirl.create(:user)

    get '/sessions/new'
    assert_response :success

    post_via_redirect '/sessions',
      :email => "dinerone@example.org",
      :password => "abc123"

    assert_equal '/', path
    assert_equal 'Welcome Diner One!', flash[:notice]
  end  

  test "user is signed in after signing up" do
    get '/users/new'
    assert_response :success

    user = {
      :name => "Diner Two",
      :email => "dinertwo@example.org",
      :password => "def456",
      :password_confirmation => "def456" 
    }

    post_via_redirect '/users', { :user => user }
      

    assert_equal '/', path
    assert_select '#login a', "Sign out"
    assert_equal 'Welcome Diner Two!', flash[:notice]

  end  

end

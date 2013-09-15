require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "shows validation errors when password not provided" do
    params = {
      name: "Example",
      email: "example@example.org",
      password: "",
      password_confirmation: ""
    }    
    post :create, user: params

    # This is icky, can't we do something with regex or something?
    assert_select "#error_explanation li", "Password can&#x27;t be blank"
    assert_select "#error_explanation li", "Password confirmation can&#x27;t be blank"
  end

  test "user is created" do
    params = {
      name: "Sample Diner",
      email: "sample@example.org",
      password: "def456",
      password_confirmation: "def456"
    }

    assert_difference('User.count', 1) do
      post :create, user: params
    end

    assert_redirected_to root_path
  end

  test "new user form is displayed" do
    get :new

    # assert_select does not track state or walk through
    # the DOM in a straight-forward line. In this case it 
    # just selects all "label" tags, and if any of them
    # happen to match the content the assert passes.

    assert_select "label", "Name"
    assert_select "label", "Email"
    assert_select "label", "Password"
    assert_select "label", "Password confirmation"
  end
end

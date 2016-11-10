require 'test_helper'

class RestaurantControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get restaurant_new_url
    assert_response :success
  end

  test "should get show" do
    get restaurant_show_url
    assert_response :success
  end

  test "should get create" do
    get restaurant_create_url
    assert_response :success
  end

  test "should get delete" do
    get restaurant_delete_url
    assert_response :success
  end

  test "should get update" do
    get restaurant_update_url
    assert_response :success
  end

end

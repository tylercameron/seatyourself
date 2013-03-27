require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name is required" do
    user = FactoryGirl.create(:user)
    user.name = ""
    refute user.valid?
  end
end

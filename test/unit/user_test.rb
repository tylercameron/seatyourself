require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name is required" do
    user = FactoryGirl.create(:user)
    user.name = ""
    refute user.valid?
  end

  test "email is required" do
    user = FactoryGirl.create(:user)
    user.email = ""
    refute user.valid?
  end

  test "password and password_confirmation are required on create" do
    user = FactoryGirl.build(:user)
    user.password = ""
    user.password_confirmation = ""
    refute user.save
  end

  test "password_confirmation must match password" do
    user = FactoryGirl.build(:user)
    user.password_confirmation = "def456"
    refute user.save
  end

  test "good password can authenticate" do
    user = FactoryGirl.create(:user)
    assert user.authenticate("abc123")
  end

  test "bad password cannot authenticate" do
    user = FactoryGirl.create(:user)
    refute user.authenticate("ghi789")
  end

  test "two users cannot have same email" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.build(:user)
    refute user2.save
  end

end

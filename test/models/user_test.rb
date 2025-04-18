require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "require email" do
    user = User.new(email: nil)
    assert_not user.save, "User was saved without email"
  end

  test "require password" do
    user = User.new(password: nil)
    assert_not user.save, "User was saved without password"
  end

  test "unique email" do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
    user = User.new(email: "test@test.com", password: "password", password_confirmation: "password")
    assert_not user.save, "User was saved with duplicate email"
  end
  
  test "password must be confirmed" do
    user = User.new(email: "test@test.com", password: "password", password_confirmation: "wrong_password")
    assert_not user.save, "User saved with invalid password confirmation"
  end
  
  test "password must be at least 8 characters" do
    user = User.new(email: "test@test.com", password: "short", password_confirmation: "short")
    assert_not user.save, "User saved with short password"
  end
  
end

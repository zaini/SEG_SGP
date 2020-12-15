require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @admin = Admin.create(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
  end

  test "should validate user with valid details" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert user.valid?, "Did not validate user with valid details"
  end

  test "should not validate empty user" do
    user = User.new
    assert !user.valid?, "Validated user with all empty details"
  end

  test "should not validate user with short first name" do
    user = User.new(admin: @admin, first_name: "a", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.valid?, "Validated user with short first name"
  end

  test "should not validate user with empty first name" do
    user = User.new(admin: @admin, first_name: "", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.valid?, "Validated user with empty first name"
  end

  test "should not validate user with short last name" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "l", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.valid?, "Validated user with short last name"
  end

  test "should not validate user with empty last name" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.valid?, "Validated user with empty last name"
  end

  test "should not validate user with empty email" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "", email_confirmation: "", password: "user123", password_confirmation: "user123")
    assert !user.valid?, "Validated user with empty email"
  end

  test "should not validate user with invalid but not empty email" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "x@e.x", email_confirmation: "a@e.x", password: "user123", password_confirmation: "user123")
    assert !user.valid?, "Validated user with invalid but not empty email"
  end

  test "should not validate user with different emails" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user123@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.valid?, "Validated user with different emails"
  end

  test "should not validate user with short password" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "1", password_confirmation: "1")
    assert !user.valid?, "Validated user with short password"
  end

  test "should not validate user with empty password" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "", password_confirmation: "")
    assert !user.valid?, "Validated user with empty password"
  end

  test "should not validate user with different passwords" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user312")
    assert !user.valid?, "Validated user with different password"
  end

  test "should not create two users with same email" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    user.save
    user2 = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user2.save, "Saved the second user with the same username"
  end
end

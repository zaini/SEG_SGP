require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
  end
  # test "should get index" do
  #   get user_index_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get user_show_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get user_new_url
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get user_edit_url
  #   assert_response :success
  # end

  # test "should get delete" do
  #   get user_delete_url
  #   assert_response :success
  # end

  test "should create user with valid details" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert user.save, "Did not save user with valid details"
  end

  test "should not create empty user" do
    user = User.new
    assert !user.save, "Saved user with all empty details"
  end

  test "should not create user with short first name" do
    user = User.new(admin: @admin, first_name: "a", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.save, "Saved user with short first name"
  end

  test "should not create user with empty first name" do
    user = User.new(admin: @admin, first_name: "", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.save, "Saved user with empty first name"
  end

  test "should not create user with short last name" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "l", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.save, "Saved user with short last name"
  end

  test "should not create user with empty last name" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.save, "Saved user with empty last name"
  end

  test "should not create user with empty email" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "", email_confirmation: "", password: "user123", password_confirmation: "user123")
    assert !user.save, "Saved user with empty email"
  end

  test "should not create user with invalid but not empty email" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "x@e.x", email_confirmation: "a@e.x", password: "user123", password_confirmation: "user123")
    assert !user.save, "Saved user with invalid but not empty email"
  end

  test "should not create user with different emails" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user123@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    assert !user.save, "Saved user with different emails"
  end

  test "should not create user with short password" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "1", password_confirmation: "1")
    assert !user.save, "Saved user with short password"
  end

  test "should not create user with empty password" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "", password_confirmation: "")
    assert !user.save, "Saved user with empty password"
  end

  test "should not create user with different passwords" do
    user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user312")
    assert !user.save, "Saved user with different password"
  end

end

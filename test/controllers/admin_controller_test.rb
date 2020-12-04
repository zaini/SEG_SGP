require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get admin_index_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get admin_show_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get admin_new_url
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get admin_edit_url
  #   assert_response :success
  # end

  # test "should get delete" do
  #   get admin_delete_url
  #   assert_response :success
  # end

  test "should create admin with valid details" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    assert admin.save, "Did not save Admin with valid details"
  end

  test "should not create empty admin" do
    admin = Admin.new
    assert !admin.save, "Saved Admin with all empty details"
  end

  test "should not create admin with short username" do
    admin = Admin.new(username: "a", email: "admin@email.com", email_confirmation: "admin@email.com", password: "password123", password_confirmation: "password123")
    assert !admin.save, "Saved admin with short username"
  end

  test "should not create admin with empty username" do
    admin = Admin.new(username: "", email: "admin@email.com", email_confirmation: "admin@email.com", password: "password123", password_confirmation: "password123")
    assert !admin.save, "Saved admin with empty username"
  end

  test "should not create admin with empty email" do
    admin = Admin.new(username: "admin", email: "", email_confirmation: "", password: "password123", password_confirmation: "password123")
    assert !admin.save, "Saved admin with empty email"
  end

  test "should not create admin with invalid but not empty email" do
    admin = Admin.new(username: "admin", email: "a@m.x", email_confirmation: "a@m.x", password: "password123", password_confirmation: "password123")
    assert !admin.save, "Saved admin with invalid but not empty email"
  end

  test "should not create admin with different emails" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin123@email.com", password: "admin123", password_confirmation: "admin123")
    assert !admin.save, "Saved admin with different emails"
  end

  test "should not create admin with short password" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "1", password_confirmation: "1")
    assert !admin.save, "Saved admin with short password"
  end

  test "should not create admin with empty password" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "", password_confirmation: "")
    assert !admin.save, "Saved admin with empty password"
  end
  
  test "should not create admin with different passwords" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin312")
    assert !admin.save, "Saved admin with different password"
  end

end

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "admin with valid details is valid" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    assert admin.valid?, "Did not save Admin with valid details"
  end

  test "should not validate empty admin" do
    admin = Admin.new
    assert !admin.valid?, "Validated Admin with all empty details"
  end

  test "should not validate admin with short username" do
    admin = Admin.new(username: "a", email: "admin@email.com", email_confirmation: "admin@email.com", password: "password123", password_confirmation: "password123")
    assert !admin.valid?, "Validated admin with short username"
  end

  test "should not validate admin with empty username" do
    admin = Admin.new(username: "", email: "admin@email.com", email_confirmation: "admin@email.com", password: "password123", password_confirmation: "password123")
    assert !admin.valid?, "Validated admin with empty username"
  end

  test "should not validate admin with empty email" do
    admin = Admin.new(username: "admin", email: "", email_confirmation: "", password: "password123", password_confirmation: "password123")
    assert !admin.valid?, "Validated admin with empty email"
  end

  test "should not validate admin with invalid but not empty email" do
    admin = Admin.new(username: "admin", email: "a@m.x", email_confirmation: "aaaa", password: "password123", password_confirmation: "password123")
    assert !admin.valid?, "Validated admin with invalid but not empty email"
  end

  test "should not validate admin with different emails" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin123@email.com", password: "admin123", password_confirmation: "admin123")
    assert !admin.valid?, "Validated admin with different emails"
  end

  test "should not validate admin with short password" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "1", password_confirmation: "1")
    assert !admin.valid?, "Validated admin with short password"
  end

  test "should not validate admin with empty password" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "", password_confirmation: "")
    assert !admin.valid?, "Validated admin with empty password"
  end
  
  test "should not validate admin with different passwords" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin312")
    assert !admin.valid?, "Validated admin with different password"
  end

  test "should not create two admins with same email" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    admin.save
    admin2 = Admin.new(username: "admin2", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    assert !admin2.save, "Saved the second admin with the same email"
  end

  test "should not create two admins with same username" do
    admin = Admin.new(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    admin.save
    admin2 = Admin.new(username: "admin", email: "admin123@email.com", email_confirmation: "admin123@email.com", password: "admin123", password_confirmation: "admin123")
    assert !admin2.save, "Saved the second admin with the same username"
  end
end

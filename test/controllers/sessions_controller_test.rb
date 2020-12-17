require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    @user = User.create(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "h@email.com", email_confirmation: "h@email.com", password: "user123", password_confirmation: "user123")    
  end

  test "user should be login with wrony password" do
    user = User.find_by(email: "h@email.com")
    @user.authenticate("user123456")
    assert !user.valid?
  end

  test "user should not be login with empty password" do
    user = User.find_by(email: "h@email.com")
    @user.authenticate(password: "")
    assert !user.valid?
  end

  test "admin should not be login with empty password" do
    admin = Admin.find_by(email: "admin@email.com")
    @admin.authenticate(password: "")
    assert !admin.valid?
  end

  test "admin should not be login with wrony password" do
    admin = Admin.find_by(email: "admin@email.com")
    @admin.authenticate(password: "123456")
    assert !admin.valid?
  end
end

require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(username:'ABCDE', email:'ABCDE@email.com', email_confirmation:'ABCDE@email.com', password:'123456', password_confirmation:'123456')
  end

  test "should get index" do
    get admins_path
    assert_response :success
  end

  test "should get new" do
     get admin_signup_url
     assert_response :success
  end

  test "post create should work with valid data" do
    assert_difference('Admin.count',1) do
      post admins_path, params: {admin:{username:'ABCDE', email:'ABCDE@email.com', email_confirmation:'ABCDE@email.com', password:'123456', password_confirmation:'123456'}}
      #:usernames, :email, :email_confirmation, :password, :password_confirmation
    end
    assert_redirected_to admin_login_path
  end

end

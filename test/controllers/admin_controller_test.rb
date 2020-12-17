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
      post admin_path, params: {username:'ABCDE', email:'ABCDE@email.com', email_confirmation:'ABCDE@email.com', password:'123456', password_confirmation:'123456'}
      #:usernames, :email, :email_confirmation, :password, :password_confirmation
    end
    assert_redirected_to admin_login_path
  end

  test "should get update" do
    patch admin_path(@admin), params: {username:'ABCDEF', email:'ABCDE@email.com', email_confirmation:'ABCDE@email.com', password:'123456', password_confirmation:'123456'}
    assert_redirected_to admin_path(@admin)
    @admin.reload
    assert_equal "ABCDEF", @admin.username
  end

  test "should get destroy" do
    assert_difference('Admin.count',-1) do
      delete admin_path(@admin)
    end
    assert_redirected_to admin_path(@admin)
  end

end

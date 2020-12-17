require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(username: "banana", email: "banana@email.com", email_confirmation: "banana@email.com", password: "banana", password_confirmation: "banana")
    @currency = Currency.create!(code: "KCL", symbol: "$", rate_to_gbp:1.1)
    @user = User.create!(admin: @admin, first_name: "Grape", middle_name: "Grape", last_name: "Grape", email: "grape@email.com", email_confirmation: "grape@email.com", password: "grape1", password_confirmation: "grape1", currency_id: @currency[:id])

    post admin_login_path, params: { session: {username: "banana", password: "banana"} }
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

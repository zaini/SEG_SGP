require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  setup do
     @admin = Admin.create!(username: "banana", email: "banana@email.com", email_confirmation: "banana@email.com", password: "banana", password_confirmation: "banana")
     @currency = Currency.create!(code: "KCL", symbol: "$", rate_to_gbp:1.1)
     @user = User.create!(admin: @admin, first_name: "Grape", middle_name: "Grape", last_name: "Grape", email: "grape@email.com", email_confirmation: "grape@email.com", password: "grape1", password_confirmation: "grape1", currency_id: @currency)
  end

  test "should get index" do
    #get admin_panel_users_path(@admin)
    get users_path
    assert_response :success
  end

  test "should get new" do
     #get "/signup_user"
     get "/users/new"
     assert_response :success
  end

  test "post create should work with valid data" do
    assert_difference('User.count',1) do
      post users_path, params: {admin: @admin, first_name:"Foo", middle_name:"Bar", last_name:"Foo", email:"foobar@email.com", email_confirmation:"foobar@email.com", password:"foobar", password_confirmation:"foobar", currency_id:@currency}
      #:first_name, :middle_name, :last_name, :email, :email_confirmation, :password, :password_confirmation, :currency_id
    end
    assert_redirected_to users_path
  end

  test "should get update" do
    patch users_path(@user), params:  {admin: @admin, first_name: "Apple", middle_name: "Grape", last_name: "Grape", email: "grape@email.com", email_confirmation: "grape@email.com", password: "grape1", password_confirmation: "grape1", currency_id: @currency}
    assert_redirected_to user_path(@user)
    @user.reload
    assert_equal "Apple", @user.first_name
  end

  test "should get destroy" do
    assert_difference('User.count',-1) do
      delete user_path(@user)
    end
    assert_redirected_to users_path
  end



end

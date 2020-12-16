require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(username:'ABCDE', email:'ABCDE@email.com', email_confirmation:'ABCDE@email.com', password:'12345', password_confirmation:'12345')
  end

  test "should get index" do
    get admin_path
    assert_response :success
  end

  test "should get new" do
     get new_admin_path
     assert_response :success
  end

  test "post create should work with valid data" do
    assert_difference('Admin.count',1) do
      post admin_path, params: {username:'ABCDE', email:'ABCDE@email.com', email_confirmation:'ABCDE@email.com', password:'12345', password_confirmation:'12345'}
      #:username, :email, :email_confirmation, :password, :password_confirmation
    end
    assert_redirected_to admin_path
  end

  test "should get update" do
    patch admin_path(@admin), params: {username:'ABCDEF', email:'ABCDE@email.com', email_confirmation:'ABCDE@email.com', password:'12345', password_confirmation:'12345'}
    assert_redirected_to admin_path
    @admin.reload
    assert_equal "ABCDEF", @admin.username
  end

  test "should get destroy" do
    assert_difference('Admin.count',-1) do
      delete admin_path(@admin)
    end
    assert_redirected_to admin_path
  end

end

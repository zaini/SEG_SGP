require 'test_helper'

class ExtrasControllerTest < ActionDispatch::IntegrationTest
  test "should get loan" do
    get loan_path
    assert_response :success
  end

  test "should get contact_us" do
    get contact_us_path
    assert_response :success
  end

  test "should get landing" do
    get root_path
    assert_response :success
  end

  test "should get savings" do
    get savings_path
    assert_response :success
  end

end

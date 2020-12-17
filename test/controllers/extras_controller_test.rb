require 'test_helper'

class ExtrasControllerTest < ActionDispatch::IntegrationTest
  test "should get loan" do
    get loan_url
    assert_response :success
  end

  test "should get contact_us" do
    get contact_us_url
    assert_response :success
  end

  test "should get landing" do
    get landing_url
    assert_response :success
  end

  test "should get savings" do
    get savings_url
    assert_response :success
  end

end

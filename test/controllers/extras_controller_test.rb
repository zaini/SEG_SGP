require 'test_helper'

class ExtrasControllerTest < ActionDispatch::IntegrationTest
  test "should get loan" do
    get extras_loan_url
    assert_response :success
  end

  test "should get contact_us" do
    get extras_contact_us_url
    assert_response :success
  end

  test "should get landing" do
    get extras_landing_url
    assert_response :success
  end

  test "should get savings" do
    get extras_savings_url
    assert_response :success
  end

end

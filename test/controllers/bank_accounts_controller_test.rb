require 'test_helper'

class BankAccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_account_path
    assert_response :success
  end

  test "should get show" do
    get bank_account_show_url
    assert_response :success
  end

  test "should get new" do
    get bank_account_new_url
    assert_response :success
  end

  test "should get edit" do
    get bank_account_edit_url
    assert_response :success
  end

  test "should get delete" do
    get bank_account_delete_url
    assert_response :success
  end

end
require 'test_helper'

class BankAccountControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    @user = User.create(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "h@email.com", email_confirmation: "h@email.com", password: "user123", password_confirmation: "user123") 
    @bank_account = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234123412341234", sort_code: "123123", interest_rate: "5")
  end

  test "should get index" do
    get bank_accounts_path
    assert_response :success
  end
end
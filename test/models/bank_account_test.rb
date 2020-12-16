require 'test_helper'

class BankAccountTest < ActiveSupport::TestCase
  setup do
    @admin = Admin.create(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    @user = User.create(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "h@email.com", email_confirmation: "h@email.com", password: "user123", password_confirmation: "user123")    
  end

  test "bank_account with valid details is valid" do
     bank_account = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234123412341234", sort_code: "123123", interest_rate: "5")
    assert bank_account.valid?, "Did not save Bank Account with valid details"
  end

  test "should not validate empty bank account" do
    bank_account = BankAccount.new
    assert !bank_account.valid?, "Validated Bank Account with all empty details"
  end

  test "should not validate bank account with empty account number" do
    bank_account = BankAccount.new(user:@user, account_name: "bank_account", account_number: "", sort_code: "123123", interest_rate: "5")
    assert !bank_account.valid?, "Validated bank account with empty account number"
  end

  test "should not validate bank account with shorter account number" do
    bank_account = BankAccount.new(user:@user, account_name: "bank_account", account_number: "12341234", sort_code: "123123", interest_rate: "5")
    assert !bank_account.valid?, "Validated bank account with shorter account numbers"
  end

  test "should not validate bank account with longer account number" do
    bank_account = BankAccount.new(user:@user, account_name: "bank_account", account_number: "123412341234123412341234", sort_code: "123123", interest_rate: "5")
    assert !bank_account.valid?, "Validated bank account with longer account numbers"
  end

  test "should not validate bank account with empty sort code" do
    bank_account = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234123412341234", sort_code: "", interest_rate: "5")
    assert !bank_account.valid?, "Validated bank account with empty sort code"
  end

  test "should not validate bank account with shorter sort code" do
    bank_account = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234123412341234", sort_code: "123", interest_rate: "5")
    assert !bank_account.valid?, "Validated bank account with shorter sort code"
  end

  test "should not validate bank account with longer sort code" do
    bank_account = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234123412341234", sort_code: "123123123", interest_rate: "5")
    assert !bank_account.valid?, "Validated bank account with longer sort code"
  end

  test "should not validate bank account with empty interest rate" do
    bank_account = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234123412341234", sort_code: "123123", interest_rate: "")
    assert !bank_account.valid?, "Validated bank account with empty interest rate"
  end

  test "should not create two bank accounts with same account number" do
    bank_account = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234123412341234", sort_code: "123123", interest_rate: "5")
    bank_account.save
    bank_account2 = BankAccount.new(user:@user, account_name: "bank account2", account_number: "1234123412341234", sort_code: "123456", interest_rate: "5")
    assert !bank_account2.save, "Saved the second bank account with the same account number"
  end

  test "should not create two bank accounts with same account name" do
    bank_account = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234123412341234", sort_code: "123123", interest_rate: "5")
    bank_account.save
    bank_account2 = BankAccount.new(user:@user, account_name: "bank account", account_number: "1234567812345678", sort_code: "123123", interest_rate: "5")
    assert !bank_account2.save, "Saved the second bank account with the same account name"
  end
end

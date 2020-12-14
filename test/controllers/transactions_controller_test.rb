require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create(username: "admin", email: "admin@email.com", email_confirmation: "admin@email.com", password: "admin123", password_confirmation: "admin123")
    @user = User.new(admin: @admin, first_name: "user", middle_name: "m", last_name: "last", email: "user@email.com", email_confirmation: "user@email.com", password: "user123", password_confirmation: "user123")
    @account = BankAccount.create!(user:@user, account_name:"account_name", account_number:'5355220468996651', sort_code:'000000')
  end

  test "should get index" do
    get :"/bank_account_transactions_path"
    assert_response :success  
  end

  test "should get new" do
    get :"/new_bank_account_transaction_path"
    assert_response :success
  end

  test "post create should work with valid data" do
    assert_difference('Transaction.count',1) do
      post :"/create_bank_account_transaction_path(@account)", params: {transaction: {bank_account_id:@account.id, date:'2020-12-01 15:48:49', description:"description", reference:"reference", money_in:'0', money_out:'100'}}
    end
    assert_redirect_to bank_account_transactions_path(@account)
  end

  test "should get update" do
    put :"/update", params: {transaction: {date:'2020-12-01 15:48:49', description:"description", reference:"reference", money_in:'0', money_out:'100'}}
    assert_response :success
  end

  test "should get destroy" do
    transaction = transactions(:one)
    assert_difference('Transaction.count',-1) do
      delete :"/destroy_bank_account_transaction_path(@account,transaction)"
    end
    assert_redirect_to bank_account_transactions_path(@account)
  end
end

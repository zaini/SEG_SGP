require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(username: "admi", email: "admi@email.com", email_confirmation: "admi@email.com", password: "admin123", password_confirmation: "admin123")
    @user = User.create!(admin: @admin, first_name: "ha", middle_name: "m", last_name: "last", email: "ha@email.com", email_confirmation: "ha@email.com", password: "user123", password_confirmation: "user123")
    @account = BankAccount.create!(user:@user, account_name:"account_name", account_number:'5355220468996651', sort_code:'000000')
    @transaction = Transaction.create!(bank_account:@account, date:'2020-12-01 15:48:49', description:'@transaction1.description', reference:'@transaction1.reference', money_in:100, money_out:20)  
  end

  test "should get index" do
    get bank_account_transactions_path(@account)
    assert_response :success  
  end

  test "should get new" do
    get new_bank_account_transaction_path(@account)
    assert_response :success
  end

  test "post create should work with valid data" do
    assert_difference('Transaction.count',1) do
      post bank_account_transactions_path(@account), params: {bank_account:@account,transaction: {date:'2020-12-01 15:48:49', description:'@transaction1.description', reference:'@transaction1.reference', money_in:100, money_out:10}}
    end
    assert_redirected_to bank_account_transactions_path(@account)
  end

  test "should get update" do
    # t = transactions(:one)
    patch bank_account_transaction_path(@account,@transaction), params:  {bank_account:@account,transaction: {date:'2020-12-05 15:48:49', description:'@transaction1.description', reference:'@transaction1.reference', money_in:1000, money_out:0}}
    assert_redirected_to bank_account_transactions_path(@account)
    @transaction.reload
    assert_equal "2020-12-05 15:48:49", @transaction.date
  end

  test "should get destroy" do
    transaction = transactions(:one)
    # transaction.bank_account = @account
    assert_difference('Transaction.count',-1) do
      delete bank_account_transaction_path(@account,@transaction)
    end
    assert_redirected_to bank_account_transactions_path(@account)
  end
end

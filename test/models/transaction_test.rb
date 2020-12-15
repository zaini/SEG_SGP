require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  setup do
    @admin = Admin.create!(username: "adm", email: "adm@email.com", email_confirmation: "adm@email.com", password: "admin123", password_confirmation: "admin123")
    @user = User.create!(admin: @admin, first_name: "hi", middle_name: "m", last_name: "last", email: "h@email.com", email_confirmation: "h@email.com", password: "user123", password_confirmation: "user123")
    @account = BankAccount.create!(user:@user, account_name:"account_name", account_number:'5355220468996651', sort_code:'000000')
  end
  
  test "transaction with all fields presented is valid" do
    transaction = Transaction.new(bank_account:@account, date:'2020-12-01 15:48:49', description:'@transaction1.description', reference:'@transaction1.reference', money_in:100, money_out:20)
    assert transaction.valid?
  end

  test "transaction with no bank account attached is invalid" do
    transaction = Transaction.new(date:'2020-12-01 15:48:49', description:'@transaction1.description', reference:'@transaction1.reference', money_in:100, money_out:20)
    assert_not transaction.valid?
  end

  test "transaction with blank date is invalid" do
    transaction = Transaction.new(bank_account:@account, date:'', description:'@transaction1.description', reference:'@transaction1.reference', money_in:100, money_out:20)
    assert_not transaction.valid?
  end

  test "transaction with blank description is invalid" do
    transaction = Transaction.new(bank_account:@account, date:'2020-12-01 15:48:49', description:'', reference:'@transaction1.reference', money_in:100, money_out:20)
    assert_not transaction.valid?
  end

  test "transaction with blank reference is invalid" do
    transaction = Transaction.new(bank_account:@account, date:'2020-12-01 15:48:49', description:'@transaction1.description', reference:'', money_in:100, money_out:20)
    assert_not transaction.valid?
  end
end

class AddInterestRateToBankAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :bank_accounts, :interest_rate, :decimal
  end
end

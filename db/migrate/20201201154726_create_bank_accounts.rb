class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.string :account_name
      t.integer :account_number
      t.string :sort_code

      t.timestamps
    end
  end
end

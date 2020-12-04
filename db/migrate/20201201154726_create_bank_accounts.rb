class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.belongs_to :user
      t.string :account_name
      t.string :account_number
      t.string :sort_code

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.text :description
      t.string :reference
      t.decimal :money_in
      t.decimal :money_out

      t.timestamps
    end
  end
end

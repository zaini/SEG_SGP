class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :code
      t.decimal :rate_to_gbp

      t.timestamps
    end
  end
end

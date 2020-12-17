class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.belongs_to :admin
      t.integer :currency_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :password
      
      t.timestamps
    end
  end
end

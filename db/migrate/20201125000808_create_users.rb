class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    # this will automatically have a primary key ID
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
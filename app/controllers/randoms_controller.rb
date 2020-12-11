class RandomsController < ApplicationController

def random
    require 'faker'

#Generate random Users
20.times do
    first_name = Faker::Name.first_name  
    middle_name = Faker::Name.middle_name
    last_name = Faker::Name.last_name 
    email = Faker::Internet.unique.email
    password = Faker::Internet.password 
    id = current_user.id
    User.create!(admin_id:id, first_name:first_name, middle_name:middle_name, last_name:last_name, email:email,email_confirmation:email,password_digest:password)
end

#Generate random Bank Accounts
10.times do
    account_name = Faker::Bank.name    #customize
    account_number = Faker::Bank.account_number 
    sort_code = Faker::Number.number(digits: 6)
    id = rand(1...20)
    date = Faker::Date.in_date_period   # Random date in current year
        description = Faker::Movie.quote     #customize
        reference = Faker::Invoice.reference
        money_in = Faker::Number.decimal(l_digits: 3, r_digits: 2) 
        money_out = 0
       Transaction.create!(bank_account:BankAccount.create!(user_id:id, account_name:account_name, account_number:account_number, sort_code:sort_code), date:date, description:description, reference:reference, money_in:money_in, money_out:money_out)
end

10.times do
    account_name = Faker::Bank.name    #customize
    account_number = Faker::Bank.account_number 
    sort_code = Faker::Number.number(digits: 6)
    id = rand(1...20)
    date = Faker::Date.in_date_period   # Random date in current year
        description = Faker::Movie.quote     #customize
        reference = Faker::Invoice.reference
        money_in = 0
        money_out = Faker::Number.decimal(l_digits: 2, r_digits: 2)
       Transaction.create!(bank_account:BankAccount.create!(user_id:id, account_name:account_name, account_number:account_number, sort_code:sort_code), date:date, description:description, reference:reference, money_in:money_in, money_out:money_out)
end

end
end
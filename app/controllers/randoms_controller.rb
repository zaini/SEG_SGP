class RandomsController < ApplicationController
    before_action :populateCurrency

    #generate random data 
    def random
        require 'faker'
        I18n.reload!

    #Generate random Users
    5.times do
        first_name = Faker::Name.first_name  
        middle_name = Faker::Name.middle_name
        last_name = Faker::Name.last_name 
        email = Faker::Internet.unique.free_email
        password = "password123" 
        id = current_user.id
        id1 = rand(1..Currency.ids.max)
        last_logged_in = Time.now
        User.create!(admin_id:id, currency_id:id1, first_name:first_name, middle_name:middle_name, last_name:last_name, email:email,email_confirmation:email,password:password, last_logged_in: last_logged_in)
    end

    #Generate random Bank Accounts
    30.times do
        account_name = Faker::Name.account_name   
        account_number = Faker::Number.unique.number(digits: 16)
        sort_code = Faker::Number.unique.number(digits: 6)
        interest_rate = Faker::Number.decimal(l_digits: 0, r_digits: 5)
        id = rand(1..User.ids.max)
        BankAccount.create!(user_id:id, account_name:account_name, account_number:account_number, sort_code:sort_code, interest_rate:interest_rate)
    end

    #Generate random Transactions
    #income
    150.times do
        date = Faker::Date.in_date_period   
        description = Faker::Name.description    
        reference = Faker::Invoice.reference
        money_in = Faker::Number.decimal(l_digits: 3, r_digits: 2) 
        money_out = 0
        id = rand(1..BankAccount.ids.max)
        Transaction.create!(bank_account_id:id, date:date, description:description, reference:reference, money_in:money_in, money_out:money_out)
    end

    #spend
    100.times do
        date = Faker::Date.in_date_period   
        description = Faker::Commerce.product_name    
        reference = Faker::Invoice.reference
        money_in = 0
        money_out = Faker::Number.decimal(l_digits: 2, r_digits: 2) 
        id = rand(1..BankAccount.ids.max)
        Transaction.create!(bank_account_id:id, date:date, description:description, reference:reference, money_in:money_in, money_out:money_out)
    end
end

private
    def populateCurrency
        if Currency.count == 0 
            Currency.create!(code:"USD", symbol:"$", rate_to_gbp:0.75)
            Currency.create!(code:"GBP", symbol:"£", rate_to_gbp:1)
            Currency.create!(code:"CNY", symbol:"¥", rate_to_gbp:0.11)
        end 
    end
end
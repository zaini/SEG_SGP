class User < ApplicationRecord
    belongs_to :admin
    has_many :bank_accounts
    has_one :currency 
    has_secure_password
    validates :password, length: { minimum: 6 }
    validates :first_name, presence: true, length: {minimum: 2}
    validates :last_name, presence: true, length: {minimum: 2}
    validates :email, presence: true, confirmation: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email_confirmation, presence: true
end

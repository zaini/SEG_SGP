class User < ApplicationRecord
    belongs_to :admin
    has_many :bank_accounts
    has_one :currency # not sure if we need this. don't think the relationship is set up properly because i can't do user.currency = gbp or something like that
    has_secure_password
    validates :first_name, presence: true, length: {minimum: 2}
    validates :last_name, presence: true, length: {minimum: 2}
    validates :email, presence: true, confirmation: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email_confirmation, presence: true
end

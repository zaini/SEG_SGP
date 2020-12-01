class User < ApplicationRecord
    belongs_to :admin
    has_many :bank_accounts
    has_secure_password
    validates :first_name, presence: true, length: {minimum: 2}
    # validates :middle_name
    validates :last_name, presence: true, length: {minimum: 2}
    validates :email, presence: true, confirmation: true
    validates :email_confirmation, presence: true
    # validates :password, presence: true, confirmation: true
    # validates :password_confirmation, presence: true
end

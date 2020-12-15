class Admin < ApplicationRecord
    has_many :users
    has_secure_password
    validates :password, length: { minimum: 6 }
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
    validates :email, presence: true, confirmation: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email_confirmation, presence: true
    # validates :password_digest, presence: true, confirmation: true
    # validates :password_digest_confirmation, presence: true
end

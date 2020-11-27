class Admin < ApplicationRecord
    has_many :users
    has_secure_password
    validates :username, presence: true, length: {minimum: 2}
    validates :email, presence: true, confirmation: true
    validates :email_confirmation, presence: true
    # validates :password_digest, presence: true, confirmation: true
    # validates :password_digest_confirmation, presence: true
end

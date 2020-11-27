class Admin < ApplicationRecord
    has_many :users
    validates :username, presence: true, length: {minimum: 2}
    validates :email, presence: true, confirmation: true
    validates :email_confirmation, presence: true
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
end

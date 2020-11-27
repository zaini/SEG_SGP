class User < ApplicationRecord
    belongs_to :admin
    validates :first_name, presence: true, length: {minimum: 2}
    # validates :middle_name
    validates :last_name, presence: true, length: {minimum: 2}
    validates :email, presence: true, confirmation: true
    validates :email_confirmation, presence: true
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
end

class BankAccount < ApplicationRecord
    belongs_to :user
    has_many :transactions, dependent: :destroy
    validates :account_name, presence: true
    validates :account_number, presence: true
    validates :sort_code, presence: true
end

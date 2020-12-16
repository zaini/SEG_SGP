class BankAccount < ApplicationRecord
    belongs_to :user
    has_many :transactions, dependent: :destroy
    validates :account_name, presence: true
    validates :account_number, presence: true, length: { is: 16 },uniqueness: true
    validates :sort_code, presence: true, length: { is: 6 },uniqueness: true
    validates :interest_rate, presence: true
end

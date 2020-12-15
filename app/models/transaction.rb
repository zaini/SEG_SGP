class Transaction < ApplicationRecord
    belongs_to :bank_account
    validates :date, presence: true
    validates :description, presence: true
    validates :reference, presence: true
    validates :money_in, presence: true
    validates :money_out, presence: true
end

class Currency < ApplicationRecord
    belongs_to :user

    validates :code, presence: true
    validates :rate_to_gbp, presence: true
    validates :symbol, presence: true
end

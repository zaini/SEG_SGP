class Currency < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :symbol, presence: true
  validates :rate_to_gbp, presence: true
end

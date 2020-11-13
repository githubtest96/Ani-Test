class Session < ApplicationRecord
  belongs_to :cinema
  belongs_to :hall
  belongs_to :film
  has_many :booking
end

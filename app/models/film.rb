class Film < ApplicationRecord
  belongs_to :cinemas
  has_many :sessions
end

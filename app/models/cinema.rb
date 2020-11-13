class Cinema < ApplicationRecord
  has_many :films
  has_many :halls
  has_many :sessions
end

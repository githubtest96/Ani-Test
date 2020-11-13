class Hall < ApplicationRecord
  belongs_to :cinema
  has_many :sessions
end

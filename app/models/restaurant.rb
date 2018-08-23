class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :user
  # has_many :users, through: :reservations
end

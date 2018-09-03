class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :user
  # has_many :users, through: :reservations

  def business_hours
    "#{opening_hour}:00 AM - #{closing_hour-12}:00 PM"
  end
end

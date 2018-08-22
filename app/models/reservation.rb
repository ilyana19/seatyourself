class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validate :check_time

  def check_time
    if  restaurant.opening_hour >= self.time_slot.hour || restaurant.closing_hour <= self.time_slot.hour
      errors.add(:base, "Reservation must be within operation hours!")
    end
  end
end

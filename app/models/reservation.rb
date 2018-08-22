class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validate :check_time
  validate :check_date

  def check_time
    if  restaurant.opening_hour >= self.time_slot.hour || restaurant.closing_hour <= self.time_slot.hour
      errors.add(:base, "Reservation must be within operation hours!")
    end
  end

  def check_date
    if Time.now >= self.time_slot
      errors.add(:base, "Reservations cannot be made in the past!")
    end
  end
end

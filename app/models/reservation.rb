class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validate :check_time
  validate :check_date
  validate :total_party_size
  validate :check_party_size

  def check_time
    if  restaurant.opening_hour > self.time_slot.hour || restaurant.closing_hour <= self.time_slot.hour
      errors.add(:base, "Reservation must be within operation hours!")
    end
  end

  def check_date
    if Time.now >= self.time_slot
      errors.add(:base, "Reservations cannot be made in the past!")
    end
  end

  def total_party_size
    total = restaurant.reservations.where(time_slot: self.time_slot).sum(:party_size) + self.party_size
    if total > restaurant.max_capacity
      errors.add(:base, "There are no available seats!")
    end
  end

  def check_party_size
    if self.party_size < restaurant.min_party_size || self.party_size > restaurant.max_party_size
      errors.add(:base, "The minimum number of people is #{restaurant.min_party_size} and the maximum number of people is #{restaurant.max_party_size}.")
    end
  end
end

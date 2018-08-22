class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  # def show_owner
  #   "#{@restaurant.users.first_name} #{@restaurant.users.last_name}"
  # end
end

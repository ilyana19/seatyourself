class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :user
  # has_many :users, through: :reservations

  def self.show_owner
    # SELECT first_name FROM users WHERE(SELECT user_id FROM restaurants WHERE(restaurants.id = 5));
  end
end

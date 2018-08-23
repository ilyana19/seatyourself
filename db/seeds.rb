Restaurant.destroy_all
User.destroy_all

users = [
  {first_name: 'Lorem', last_name: 'Ipsum', phone: '123456789', email: 'lorem@seatyourself.com', password: 'password', password_confirmation: 'password', is_owner: 'true'}
]

users.each do |user|
  User.create(user)
end

restaurants = [
  {name: "The Green Dragon", neighbourhood: 'Toronto', address: '123 Fake Street East', price_range: '15-20', menu: 'They serve dragons.', summary: "The place where the coolest vertically challenged citizens of Middle-Earth get loud and tell tall tales", user: User.first, opening_hour: 10, closing_hour: 23, max_capacity: 50},
  {name: "Cantina at Mos Eisley", neighbourhood: 'North York', address: '2345 Mos Eisley', price_range: '35-60', menu: 'Any food.', summary: "If you want to prove you can hang with scum and villainy's greatest hits, this is your joint", user: User.first, opening_hour: 10, closing_hour: 23, max_capacity: 50},
  {name: "The Hog's Head", neighbourhood: 'Toronto', address: '895 Fake Street West', price_range: '10-40', menu: 'Lots of drinks.', summary: "Aspiring wizards drink butterbeer here and host mind-numbing after parties", user: User.first, opening_hour: 10, closing_hour: 23, max_capacity: 50},
  {name: "The Babylon Club", neighbourhood: 'North York', address: '9588 North York', price_range: '40-60', menu: 'Pricey food.', summary: "Say hello to your little friend, or other friends at this south Florida staple", user: User.first, opening_hour: 10, closing_hour: 23, max_capacity: 50}
]

restaurants.each do |restaurant|
  Restaurant.create(restaurant)
end
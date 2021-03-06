# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

leaders = Leader.create([{name: 'Tito Fuentes', email: 'user@example.com', phone: "5555555555"}, {name: 'John Woodsman', email: 'user2@example.com',
	phone: "2055555555"},{name: 'Nick Offerman', email: 'user3@example.com', phone: "8645555555"}])

trips = Trip.create([{title: 'Tallulah Gorge', leader: 2, price: 500, start_date: Date.today+1, end_date: Date.today + 3}, {title: 'Outer Space',
	price: 10000, leader: 3, start_date: Date.today+1, end_date: Date.today + 20}, {title: 'Bobs Gorge', leader: 2, price: 300, start_date: Date.today+1, end_date: Date.today + 3}, {title: 'Space: The Final Frontier',
  price: 10000, leader: 3, start_date: Date.today, end_date: Date.today + 20}])
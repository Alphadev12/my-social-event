# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 20.times do
# 	first_name = Faker::Name.first_name.downcase
# 	u = User.create(
# 		email: first_name + "@yopmail.com",
# 		encrypted_password: "",
# 		description: Faker::Lorem.sentences(number: 1).join,
# 		first_name: first_name,
# 		last_name: Faker::Name.last_name
# 	)
# end
admin = User.find(1)
20.times do

e = Event.new(
	start_date: Time.now + (rand(9)*3600),
	duration: Faker::Number.digit * 5,
	title: Faker::Game.title,
	description: Faker::Lorem.sentences.join(" "),
	price: Faker::Number.between(from: 1, to: 1000),
	location: Faker::Nation.capital_city
)

e.admin = admin
e.save
end
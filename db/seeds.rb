# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "test@test.com", password: 'test', password_confirmation: 'test')
10.times do
User.create(email:  Faker::Internet.email, password: "password", password_confirmation: "password")

#    Person.create(fname: Faker::Name.first_name, lname: Faker::Name.last_name, email: Faker::Internet.email)
end
# 10.times do
#     Medication.create(name: Faker::Name.first_name, dose: 1, schedule: 1)
# end

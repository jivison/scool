# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


NUM_USERS = 25
NUM_COURSES = 35
NUM_ASSIGNMENTS = 40
PASSWORD = "supersecret"

User.delete_all
Course.delete_all
Assignment.delete_all

super_user = User.create(
  first_name: "ian",
  last_name: "mckinnon",
  email: "admin@codecore.ca",
  status: "active",
  password: PASSWORD
)

NUM_USERS.times do
  first_name =  Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@codecore.ca",
    password: "codecore"
  )
end

users = User.all

NUM_COURSES.times do
  name = Faker::Book
  description = Faker::Quote.famous_last_words
  start_date = Faker::Date.between(from: 30.days.ago, to: Date.today)
  end_date = Faker::Date.forward(days: 90) 
  Course.create(
    name: name,
    description: description,
    status:  ["active", "inactive"].shuffle.first,
    course_type: ["Computer", "Business", "Art"].shuffle.first,
    start_date: start_date,
    end_date: end_date
  )
end

courses = Course.all

NUM_ASSIGNMENTS.times do
  name = Faker::Books::CultureSeries.book
  Assignment.create(
    name: name
  )
end

assignments = Assignment.all







puts Cowsay.say("Generated #{users.count} users", :stegosaurus)
puts Cowsay.say("Generated #{courses.count} questions", :frogs)
puts Cowsay.say("Generated #{assignments.count} questions", :frogs)

puts "Login with #{super_user.email} and password: #{PASSWORD}"





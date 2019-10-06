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
NUM_COURSEASSIGNMENTS = 10
NUM_COURSEBLOCKS = 40
NUM_SUBMISSIONS = 40
NUM_ATTENDANCES = 40

PASSWORD = "supersecret"

<<<<<<< HEAD

CourseAssignment.delete_all
CourseBlock.delete_all
=======
CourseAssignment.delete_all
CourseBlock.delete_all
CourseRole.delete_all
User.delete_all
Course.delete_all
Assignment.delete_all
>>>>>>> 917348b7d0e01b13cf08e82eb5de33c0cc241e5e

Course.delete_all
Assignment.delete_all
User.delete_all

super_user = User.create(
  first_name: "ian",
  last_name: "mckinnon",
  email: "admin@codecore.ca",
  status: "active",
  password: PASSWORD,
  # is_admin: true
)

NUM_COURSES.times do
  name = Faker::Book.title
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

NUM_USERS.times do
  first_name =  Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@codecore.ca",
    password: "codecore"
  )

  cr = CourseRole.create(
    role: ["student", "instructor"].sample,
    user_id: user.id,
    course_id: Course.all.sample.id,  
    is_archived: false
  )
  
end

users = User.all


NUM_ASSIGNMENTS.times do
  name = Faker::Books::CultureSeries.book
  description = Faker::Books::Lovecraft.sentence
  Assignment.create(
    name: name,
    description: description, 
  )
end

assignments = Assignment.all


NUM_COURSEASSIGNMENTS.times do
  assign_date = Faker::Date.between(from: 30.days.ago, to: Date.today)
  due_date = Faker::Date.forward(days: 90) 
  CourseAssignment.create(
    assign_date: assign_date,
    due_date: due_date,
    is_active: [true, false].sample,
    assignment_id: Assignment.all.sample.id,
    course_id: Course.all.sample.id,
    course_role_assigner_id: CourseRole.where(role: "instructor").sample.id
  )
end

course_assignments = CourseAssignment.all

NUM_COURSEBLOCKS.times do |index|
  
  CourseBlock.create(
    date: Time.now + index.day,
    course_block_type: ["Morning", "Afternoon", "Evening"].shuffle.first
    courserole_id: CourseRole.all.sample.id
  )
end

course_blocks = CourseBlock.all

NUM_SUBMISSIONS.times do
  submission_date: Faker::Date.forward(days: 90) 
  Submission.create(
    grade: ["A", "B", "C", "D", "E", "F"].shuffle.first,
    submission_date: submission_date,
    courseassignment_id: CourseAssignment.all.sample.id,
    
  )
end

submissions = Submission.all


NUM_ATTENDANCES.times do
  Attendance.create(
    present:[true, false].shuffle.first,
    courseblock_id: CourseBlock.all.sample.id,
    courserole_id: CourseRole.all.sample.id
  )
end

attendances = Attendance.all

puts Cowsay.say("Generated #{users.count} users", :stegosaurus)
puts Cowsay.say("Generated #{courses.count} courses", :frogs)
puts Cowsay.say("Generated #{assignments.count} assignments", :frogs)
puts Cowsay.say("Generated #{course_assignments.count} course_assignments", :frogs)
<<<<<<< HEAD
puts Cowsay.say("Generated #{course_blocks.count} course_blocks", :frogs)
puts Cowsay.say("Generated #{submissions.count} submissions", :frogs)
puts Cowsay.say("Generated #{attendances.count} attendances", :frogs)
=======
puts Cowsay.say("Generated #{CourseRole.count} course_roles", :cheese)
# puts Cowsay.say("Generated #{course_blocks.count} course_blocks", :frogs)
>>>>>>> 917348b7d0e01b13cf08e82eb5de33c0cc241e5e

puts "Login with #{super_user.email} and password: #{PASSWORD}"





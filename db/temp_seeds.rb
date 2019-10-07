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
NUM_SUBMISSIONS = 5
NUM_ATTENDANCES = 40

PASSWORD = "supersecret"

Submission.delete_all
Attendance.delete_all
CourseBlock.delete_all
CourseAssignment.delete_all
CourseRole.delete_all
User.delete_all
Course.delete_all
Assignment.delete_all


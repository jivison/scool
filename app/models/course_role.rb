class CourseRole < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :course_blocks, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :course_assignments, dependent: :nullify

  belongs_to :user
  belongs_to :course
end

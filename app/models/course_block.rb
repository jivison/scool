class CourseBlock < ApplicationRecord
  has_many :attendances, dependent: :destroy
  belongs_to :course
  belongs_to :course_role

end

class CourseRole < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :course_blocks, dependent: :destroy

  belongs_to :user
  belongs_to :course
end

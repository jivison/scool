class Course < ApplicationRecord
  has_many :course_roles, dependent: :destroy
  has_many :course_blocks, dependent: :destroy
  has_many :course_assignments, dependent: :destroy

end

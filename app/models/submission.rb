class Submission < ApplicationRecord
  belongs_to :course_assignments
  belongs_to :course_roles
end

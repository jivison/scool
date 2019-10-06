class Submission < ApplicationRecord
  belongs_to :course_assignment
  belongs_to :course_role

  validates(:submission_date, presence: true)
end

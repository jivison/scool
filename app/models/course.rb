class Course < ApplicationRecord
  has_many :course_roles, dependent: :destroy
  has_many :course_blocks, dependent: :destroy
  has_many :course_assignments, dependent: :destroy
  has_many :users, through: :course_roles




  before_validation :set_default_status

  validates(:name, presence: true)

  def instructors
    self.course_roles.where(role: "instructor").map(&:userp)
  end

  def enrolled
    self.course_roles.where(role: "student").map(&:user)
  end

  def markers
    self.course_assignments.map(&:submissions).flatten.inject([]) { |acc,submission|
      acc << CourseRole.find(submission.course_role_marker_id).user if submission.course_role_marker_id
      acc.uniq
    }
  end

  private
  def set_default_status
    self.status ||= "new"
  end
end


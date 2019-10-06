class CourseAssignment < ApplicationRecord
  has_many :submissions, dependent: :destroy

  belongs_to :course
  belongs_to :assignment
  belongs_to :course_role

  before_validation :set_default_is_active

  private

  def set_default_is_active
    self.is_active ||= true
  end
end

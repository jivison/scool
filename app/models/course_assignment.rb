class CourseAssignment < ApplicationRecord
  has_many :submissions, dependent: :destroy

  belongs_to :courses
  belongs_to :assignments
  belongs_to :course_roles

  before_validation :set_default_is_active

  private

  def set_default_is_active
    self.is_active ||= true
  end
end

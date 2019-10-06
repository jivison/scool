class Course < ApplicationRecord
  has_many :course_roles, dependent: :destroy
  has_many :course_blocks, dependent: :destroy
  has_many :course_assignments, dependent: :destroy

  before_validation :set_default_status

  validates(:name, presence: true)

  private

  def set_default_status
    self.status ||= "new"
  end
end

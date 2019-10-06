class Submission < ApplicationRecord
  belongs_to :course_assignment

  validates(:submission_date, presence: true)

  def submitter
    User.find(self.course_role_submitter_id)
  end

  def marker
    User.find(self.course_role_marker_id)
  end

end

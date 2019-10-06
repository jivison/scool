class Submission < ApplicationRecord
  belongs_to :course_assignment

  def submitter
    User.find(self.course_role_submitter_id)
  end

  def marker
    User.find(self.course_role_marker_id)
  end

end

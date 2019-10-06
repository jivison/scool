class CourseAssignment < ApplicationRecord

    belongs_to :course

    def is_marked?
        self.submissions.find_by(course_role_submitter_id: current_user.id).present?
    end
    
    # Returns the assignments that have been assigned and are past due
    def self.past
        CourseAssignment.where("assign_date < ? AND due_date < ?", Time.now, Time.now).order(asc: :due_date)
    end

    # Return the assignments that haven't been assigned yet
    def self.upcoming
        CourseAssignment.where("assign_date > ?", Time.now).order(asc: :due_date)
    end

    # Return the assignments that are due and 
    def self.pending
        CourseAssignment.where("assign_date < ? AND due_date > ?", Time.now, Time.now).order(asc: :due_date)
    end
end

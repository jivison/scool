class SubmissionsController < ApplicationController

    before_action :find_submission, only: [:edit]

    def index
        # Only the instructor would be able to see this page

        @course_assignment = CourseAssignment.find(params[:course_assignment_id])
        @submissions = Submission.where(course_assignment_id: @course_assignment.id)
    end

    def edit
    end

    private
    def find_submission
        @submission = Submission.find(params[:id])
    end

end

class SubmissionsController < ApplicationController

    before_action :find_submission, only: [:edit, :update]

    def index
        # Only the instructor would be able to see this page

        @course_assignment = CourseAssignment.find(params[:course_assignment_id])
        @submissions = Submission.where(course_assignment_id: @course_assignment.id)
    end

    def edit
    end

    def update
        if @submission.update params.require(:submission).permit(:feedback, :score)
            # @submission.course_role_marker_id = current_user.current_role
            redirect_to course_course_assignment_path(@submission.course, @submission.course_assignment)
        else
            render :edit
        end
    end

    private
    def find_submission
        @submission = Submission.find(params[:id])
    end

end

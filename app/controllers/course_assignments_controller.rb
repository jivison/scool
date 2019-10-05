class CourseAssignmentsController < ApplicationController
    before_action :find_course_assignment, only: [:show]

    def index
        @course_assignments = CourseAssignment.all
    end

    def new 
        @assignments = Assignment.all.select do |assignment|
            !(@course_assignment.course.course_assignments.map(&:id).include? assignment.id)
        end
    end
    
    def show
    end 

    private
    def find_course_assignment
        @course_assignment = CourseAssignment.find(params[:id])
    end

end

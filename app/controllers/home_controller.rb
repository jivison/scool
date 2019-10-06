class HomeController < ApplicationController
    def index
        @courses = [Course.last]
        @assignments = CourseAssignment.where(course_id: @courses[0].id)

        # role = current_user.current_role.type
        role = "student"
        if role === "student"
            render :student_homepage
        elsif role === "admin"
            render :admin_homepage
        elsif role === "instructor"
            render :instructor_homepage
        end
    end
end

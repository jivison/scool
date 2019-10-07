class HomeController < ApplicationController
    def index
        @courses = current_user.course_roles.map(&:course)
        @assignments = @courses.map(&:course_assignments).flatten

        # role = current_user.current_role.type
        role = "instructor"
        if role === "student"
            render :student_homepage
        elsif role === "admin"
            render :admin_homepage
        elsif role === "instructor"
            render :instructor_homepage
        end
    end
end

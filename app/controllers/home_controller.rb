class HomeController < ApplicationController
    def index
<<<<<<< HEAD
        @courses = [Course.last]
        @assignments = CourseAssignment.where(course_id: @courses[0].id)
        @date =
=======
        @courses = current_user.course_roles.map(&:course)
        @assignments = @courses.map(&:course_assignments).flatten
>>>>>>> 3f057a952a23f14b3f426c5b2d4afe5894d19902

        # role = current_user.current_role.type
        role = "admin"
        if role === "student"
            render :student_homepage
        elsif role === "admin"
            @courses = Course.all
            @users = User.all
            render :admin_homepage
        elsif role === "instructor"
            render :instructor_homepage
        end
    end
end

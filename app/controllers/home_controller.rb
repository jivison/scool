class HomeController < ApplicationController
    def index
        # @assignments
        # @courses
        @course = Course.last

        # role = current_user.current_role.type
        # if role === "student"
            # render :student_homepage
        # elsif role === "admin"
        #     render :admin_homepage
        # elsif role === "instructor"
        #     render :instructor_homepage
        # end


    end
end

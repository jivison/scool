class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.user_id
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def password
  end

  def update_password
  end

  def destroy
  end
  
  def courses
    @user = User.find(params[:id])
    @active_courses = @user.active_courses
    @archived_courses = @user.archived_courses
  end
    
  def due_assignments
    # For students only
    @assignments = current_user.current_course_role.course.course_assignments.pending
  end

  def submitted_assignments
    # For instructors only
    @assignments = current_user.course_roles.where(role: "instructor").map(&:course).map { |course|
      course.course_assignments.select { |ca|
        ca.submissions.inject(false) { |acc, submission|
          submission.course_role_marker_id.nil? && !acc ? true : acc
          }
        }
      }.flatten

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :status, :img_url, :is_admin)
  end




end

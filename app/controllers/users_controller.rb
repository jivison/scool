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
    @user = user.find(params[:id])
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

  def due_assignments
    # For students only
    @assignments = current_user.current_course_role.course.course_assignments.pending
  end

  def submitted_assignments
    # For instructors only
    @assignments = current_user.course_roles.where(role: "instructor").map(&:course).map do |course|
      course.course_assignments.select do |assignment|
        assignment.submissions.inject(false) { |acc, submission|
          if !is_marked?(submission: submission) && !acc
            return true
          else
            return acc
          end
        }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :status, :img_url, :is_admin)
  end




end
